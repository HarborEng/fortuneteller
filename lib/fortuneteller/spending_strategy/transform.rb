module FortuneTeller
  module SpendingStrategy

    # The transforms generated by a spending strategy object
    class Transform < FortuneTeller::Base::Transform
      def initialize(holder:, date:, data:)
        @data = data
        super(holder: holder, date: date)
      end

      def apply_to!(sim:)
        if(@data[:strategy] == :exact)
          desired_debit = [sim.inflate_year(amount: @data[:amount], year: @date.year) - sim.guaranteed_take_home(date.year, date.month), 0].max
        elsif(@data[:strategy] == :dynamic)
          current = sim.instance_get(:spending_strategy)
          if(!current.nil? and current[:year] == @date.year)
            desired_debit = current[:amount]
          else
            # first find the total
            totals_grouped = {
              roth: 0,
              qualified: 0,
              regular: 0
            }
            sim.account_keys.each do |k|
              sim.pass_time_account!(key: k, to: @date)
              totals_grouped[FortuneTeller::Account::Component::TAX_MAP[sim.account_type(key: k)]] += sim.balance(key: k)
            end

            total = 0
            totals_grouped.each do |tax_type, amount|
              total += (amount*FortuneTeller::Utils::TaxCalculator::FLAT[tax_type])
            end

            y_i = [(@data[:end_year] - @date.year), 0].max
            percent = @data[:withdrawal_rates][y_i]
            amount = ( total*(percent.to_f/100.0) / 12.0 ).round
            sim.instance_set(:spending_strategy, {
              amount: amount,
              year: @data[:day_plan_id]
            })
            desired_debit = amount
          end
        elsif(@data[:strategy] == :percent)
          current = sim.instance_get(:spending_strategy)
          if(!current.nil? and current[:day_plan_id] == @data[:day_plan_id])
            # Great, we already calculated percent of balance.
            desired_debit = sim.inflate_year(amount: current[:amount], year: @date.year)
          else
            # Get the total balance
            totals_grouped = {
              roth: 0,
              qualified: 0,
              regular: 0
            }
            sim.account_keys.each do |k|
              sim.pass_time_account!(key: k, to: @date)
              totals_grouped[FortuneTeller::Account::Component::TAX_MAP[sim.account_type(key: k)]] += sim.balance(key: k)
            end

            total = 0
            totals_grouped.each do |tax_type, amount|
              total += (amount*FortuneTeller::Utils::TaxCalculator::FLAT[tax_type])
            end

            # Now get the percent
            start_amount = (total*@data[:percent].to_f/(100*12)).round

            #set it on the instance so we don't recalculate next time
            inflating = Utils::InflatingInt.new(
              int: start_amount,
              start_date: @date,
              growth_key: :inflation
            )

            sim.instance_set(:spending_strategy, {
              amount: inflating,
              day_plan_id: @data[:day_plan_id]
            })

            desired_debit = start_amount
          end
        end

        sim.debit!(amount: desired_debit, date: date)
      end
    end
  end
end