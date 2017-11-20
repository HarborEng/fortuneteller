module FortuneTeller
  module Utils

    # Calculates adjusted benefit from PIA
    # Based on https://www.ssa.gov/oact/quickcalc/early_late.html 11/16/2017
    module SocialSecurity
      TRANSITION_YEARS = {
        1938 => [65, 2], 1939 => [65, 4], 1940 => [65, 6], 1941 => [65, 8],
        1942 => [65, 10], 1955 => [66, 2], 1956 => [66, 4], 1957 => [66, 6],
        1958 => [66, 8], 1959 => [66, 10],
      }
      DELAY_RATES = {
        1925 => (7/24.0), 1926 =>	(7/24.0), 1927 => (8/24.0), 1928 =>	(8/24.0),
        1929 => (9/24.0), 1930 =>	(9/24.0), 1931 => (10/24.0), 1932 =>	(10/24.0),
        1933 => (11/24.0), 1934 =>	(11/24.0), 1935 => (12/24.0), 1936 => (12/24.0),
        1937 => (13/24.0), 1938 => (13/24.0), 1939 => (14/24.0), 1940 => (14/24.0),
        1941 => (15/24.0), 1942 => (15/24.0),
      }

      def self.calculate_benefit(pia:, dob:, start_month:)
        start_month = start_month.at_beginning_of_month
        adjusted_dob = adjust_dob(dob)
        frm = full_retirement_month(adjusted_dob: adjusted_dob)

        return pia if start_month == frm

        if(start_month < frm)
          min_rm = min_retirement_month(adjusted_dob: adjusted_dob)
          raise bounds_error(start: frm, min: min_rm) if start_month < min_rm
          diff = month_diff(start_month, frm)
          early_pia(pia: pia, adjusted_dob: adjusted_dob, months: diff)
        else
          max_rm = max_retirement_month(adjusted_dob: adjusted_dob)
          raise bounds_error(start: frm, max: max_rm) if start_month > max_rm
          diff = month_diff(frm, start_month)
          late_pia(pia: pia, adjusted_dob: adjusted_dob, months: diff)
        end
      end

      def self.max_retirement_month(adjusted_dob: nil, dob: nil)
        adjusted_dob = adjust_dob(dob) if adjusted_dob.nil?
        adjusted_dob.at_beginning_of_month.years_since(70)
      end

      def self.min_retirement_month(adjusted_dob: nil, dob: nil)
        adjusted_dob = adjust_dob(dob) if adjusted_dob.nil?
        if adjusted_dob.day == 1
          adjusted_dob.years_since(62)
        else
          adjusted_dob.at_beginning_of_month.years_since(62).months_since(1)
        end
      end

      def self.full_retirement_month(adjusted_dob: nil, dob: nil)
        adjusted_dob = adjust_dob(dob) if adjusted_dob.nil?
        year = adjusted_dob.year
        frm = adjusted_dob.at_beginning_of_month
        return frm.years_since(65) if year <= 1938
        return frm.years_since(66) if (year >= 1943 and year <= 1954)
        return frm.years_since(67) if year >= 1960

        t = TRANSITION_YEARS[year][0]
        frm.years_since(t[0]).years_since(t[1])
      end

      private

      def self.early_pia(pia:, adjusted_dob:, months:)
        if months <= 36
          multiplier = 100.0 - ((5.0 * months) / 9.0)
        else
          multiplier = 100.0 - 20.0 - ((5.0 * months) / 12.0)
        end
        puts "MONTHS: #{months}"
        puts "MULTIPLIER: #{multiplier}"
        puts "EARLY PIA: #{(pia*multiplier/100.0).floor}"
        (pia*multiplier/100.0).floor
      end

      def self.late_pia(pia:, adjusted_dob:, months:)
        year = adjusted_dob.year
        if year <= 1924
          monthly = 6/24.0
        elsif year <= 1942
          monthly = DELAY_RATES[year]
        else
          monthly = 16.0/24.0
        end
        multiplier = 100.0 + (monthly*months)
        puts "LATE PIA: #{(pia*multiplier/100.0).floor}"
        (pia*multiplier/100.0).floor
      end

      def self.month_diff(a, b)
        (b.year * 12 + b.month) - (a.year * 12 + a.month)
      end

      def self.bounds_error(requested:, min: nil, max: nil)
        self.module::StartDateBounds.new(**args)
      end

      def self.adjust_dob(dob)
        if(dob.day == 1)
          dob.yesterday
        else
          dob
        end
      end

      class CollectionDateBounds < StandardError
        attr_reader :thing
        def initialize(msg="My default message", thing="apple")
          @thing = thing
          super(msg)
        end
      end

    end
  end
end