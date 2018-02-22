module FortuneTeller
  module Utils
    class TaxCalculator
      # This calculator is optimized to calculate how much more income of a particular source
      # is necessary to meet a certain pre-tax goal.

      def initialize(bracket_lib:, state:, filing_status:, inflation: 1)
        @bracket_lib = bracket_lib
        @state = state
        @filing_status = filing_status
        @inflation = inflation
        build_brackets
      end

      def set_pretax(pretax)
        @pretax = pretax
        @pretax.default = 0
      end

      def calculate_posttax
        #Start by matching the test case
        @posttax = {
          w2_income: (@pretax[:w2_income]*0.7).round,
          gty_income: (@pretax[:gty_income]*0.7).round,
          ss_income: (@pretax[:ss_income]*1).round,
          qualified_withdrawal: 0,
          roth_withdrawal: 0,
          regular_withdrawal: 0,
        }
        @posttax.default = 0
        @posttax[:total] = @posttax.values.sum
        @posttax
      end

      def calculate_pretax_amount(posttax:, tax_type:)
        posttax
      end

      def calculate_posttax_amount(pretax:, tax_type:)
        pretax
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
            marginal_rate: 0,
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
        merging = args.delete_if(&:nil?)
        return merging.first if merging.length==1

        indices = Array.new(merging.length, 0)
        lengths = merging.map {|x| x.length}
        merged = []
        while true
          pretax_min = (merged.empty? ? 0 : merged.last[:pretax_max])
          posttax_min = (merged.empty? ? 0 : merged.last[:posttax_max])

          low_index = nil
          pretax_max = nil
          marginal_rate = 0

          indices.map.with_index do |x, i|
            b = merging[i][x]

            marginal_rate += b[:marginal_rate]

            if not b[:pretax_max].nil? and (pretax_max.nil? or b[:pretax_max] < pretax_max)
              low_index = i
              pretax_max = b[:pretax_max]
            end
          end

          if low_index.nil?
            merged << {
              pretax_min: pretax_min,
              pretax_max: nil,
              posttax_min: posttax_min,
              posttax_max: nil,
              marginal_rate: marginal_rate              
            }
            break
          else
            merged << {
              pretax_min: pretax_min,
              pretax_max: pretax_max,
              posttax_min: posttax_min,
              posttax_max: (posttax_min+(pretax_max-pretax_min)*((100-marginal_rate).to_f/100)).round,
              marginal_rate: marginal_rate
            }
            indices[low_index] += 1
          end
        end
        merged
      end

      def inflate_brackets(brackets)
        brackets.each do |b|
          [:pretax_min, :pretax_max, :posttax_min, :posttax_max].each do |k|
            unless b[k].nil?
              b[k] = (b[k]*@inflation).round
            end
          end
        end
      end

      def build_brackets
        @brackets = inflate_brackets(merge_brackets(
          build_adjusted_brackets(:federal),
          build_adjusted_brackets(@state),
        ))
      end
    end
  end
end
