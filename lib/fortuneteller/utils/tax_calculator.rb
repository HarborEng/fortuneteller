module FortuneTeller
  module Utils
    class TaxCalculator
      # This calculator is optimized to calculate how much more income of a particular source
      # is necessary to meet a certain pre-tax goal.

      def initialize(bracket_lib:, state:, filing_status:)
        @bracket_lib = bracket_lib
        @state = state
        @filing_status = filing_status
        build_brackets
      end

      private

      def build_adjusted_brackets(key)
        # The adjustment is that we roll the standard deduction into a zero-tax bracket
        data = @bracket_lib[key][@filing_status]

        return nil if (not data[:type].nil? and data[:type]=="none")

        brackets = []

        if data[:deductions].empty?
          deduction = 0
        else
          deduction = data[:deductions].first[:deduction_amount]*100
          brackets << {
            pretax_min: 0,
            pretax_max: deduction,
            posttax_min: 0,
            posttax_max: deduction,
            marginal_rate: 0
          }
        end

        bracket_ct = data[:income_tax_brackets].length
        data[:income_tax_brackets].each_with_index do |b, i|
          pretax_min = (b[:bracket]*100)+deduction
          pretax_max = (((i+1) < bracket_ct) ? (data[:income_tax_brackets][i+1][:bracket]*100)+deduction : nil)
          if b[:marginal_rate]==0 and not brackets.empty?
            brackets[0][:pretax_max] = pretax_max
            brackets[0][:posttax_max] = pretax_max
          else
            posttax_min = (brackets.empty? ? 0 : brackets.last[:posttax_max])
            if pretax_max.nil?
              posttax_max = nil
            else 
              posttax_max = (posttax_min+(pretax_max-pretax_min)*((100-b[:marginal_rate]).to_f/100)).round
            end
            brackets << {
              pretax_min: pretax_min,
              pretax_max: pretax_max,
              posttax_min: posttax_min,
              posttax_max: posttax_max,
              marginal_rate: b[:marginal_rate]
            }
          end
        end
        brackets     
      end

      def merge_brackets(*args)

      end

      def build_brackets
        merge_brackets(
          build_adjusted_brackets(:federal),
          build_adjusted_brackets(@state),
        )
      end
    end
  end
end
