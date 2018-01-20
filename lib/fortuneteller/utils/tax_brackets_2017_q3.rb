module FortuneTeller
  module Utils
    # Pulled from https://github.com/taxee/taxee-tax-statistics
    TAX_BRACKETS_2017_Q3 = 
      {:alabama=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>2500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>500, :marginal_rate=>4},
             {:bracket=>3000, :marginal_rate=>5}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>7500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>1000, :marginal_rate=>4},
             {:bracket=>6000, :marginal_rate=>5}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>2500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>500, :marginal_rate=>4},
             {:bracket=>3000, :marginal_rate=>5}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>2500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>500, :marginal_rate=>4},
             {:bracket=>3000, :marginal_rate=>5}]}},
       :alaska=>
        {:single=>{:type=>"none"},
         :married=>{:type=>"none"},
         :married_separately=>{:type=>"none"},
         :head_of_household=>{:type=>"none"}},
       :arizona=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>5009}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.59},
             {:bracket=>10000, :marginal_rate=>2.88},
             {:bracket=>25000, :marginal_rate=>3.36},
             {:bracket=>50000, :marginal_rate=>4.24},
             {:bracket=>150000, :marginal_rate=>4.54}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>10010}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.59},
             {:bracket=>20000, :marginal_rate=>2.88},
             {:bracket=>50000, :marginal_rate=>3.36},
             {:bracket=>100000, :marginal_rate=>4.24},
             {:bracket=>300000, :marginal_rate=>4.54}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>5009}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.59},
             {:bracket=>10000, :marginal_rate=>2.88},
             {:bracket=>25000, :marginal_rate=>3.36},
             {:bracket=>50000, :marginal_rate=>4.24},
             {:bracket=>150000, :marginal_rate=>4.54}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>5009}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.59},
             {:bracket=>20000, :marginal_rate=>2.88},
             {:bracket=>50000, :marginal_rate=>3.36},
             {:bracket=>100000, :marginal_rate=>4.24},
             {:bracket=>300000, :marginal_rate=>4.54}]}},
       :arkansas=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>2200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.9},
             {:bracket=>4299, :marginal_rate=>2.5},
             {:bracket=>8399, :marginal_rate=>3.5},
             {:bracket=>12599, :marginal_rate=>4.5},
             {:bracket=>20999, :marginal_rate=>6},
             {:bracket=>35099, :marginal_rate=>6.9}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>4400}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.9},
             {:bracket=>4299, :marginal_rate=>2.5},
             {:bracket=>8399, :marginal_rate=>3.5},
             {:bracket=>12599, :marginal_rate=>4.5},
             {:bracket=>20999, :marginal_rate=>6},
             {:bracket=>35099, :marginal_rate=>6.9}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>2200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.9},
             {:bracket=>4299, :marginal_rate=>2.5},
             {:bracket=>8399, :marginal_rate=>3.5},
             {:bracket=>12599, :marginal_rate=>4.5},
             {:bracket=>20999, :marginal_rate=>6},
             {:bracket=>35099, :marginal_rate=>6.9}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>2200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.9},
             {:bracket=>4299, :marginal_rate=>2.5},
             {:bracket=>8399, :marginal_rate=>3.5},
             {:bracket=>12599, :marginal_rate=>4.5},
             {:bracket=>20999, :marginal_rate=>6},
             {:bracket=>35099, :marginal_rate=>6.9}]}},
       :california=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>3992}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>7850, :marginal_rate=>2},
             {:bracket=>18610, :marginal_rate=>4},
             {:bracket=>29372, :marginal_rate=>6},
             {:bracket=>40773, :marginal_rate=>8},
             {:bracket=>51530, :marginal_rate=>9.3},
             {:bracket=>263222, :marginal_rate=>10.3},
             {:bracket=>315866, :marginal_rate=>11.3},
             {:bracket=>526443, :marginal_rate=>12.3},
             {:bracket=>1000000, :marginal_rate=>13.3}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>7984}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>15700, :marginal_rate=>2},
             {:bracket=>37220, :marginal_rate=>4},
             {:bracket=>58744, :marginal_rate=>6},
             {:bracket=>81546, :marginal_rate=>8},
             {:bracket=>103060, :marginal_rate=>9.3},
             {:bracket=>526444, :marginal_rate=>10.3},
             {:bracket=>631732, :marginal_rate=>11.3},
             {:bracket=>1000000, :marginal_rate=>12.3},
             {:bracket=>1052886, :marginal_rate=>13.3}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>3992}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>7850, :marginal_rate=>2},
             {:bracket=>18610, :marginal_rate=>4},
             {:bracket=>29372, :marginal_rate=>6},
             {:bracket=>40773, :marginal_rate=>8},
             {:bracket=>51530, :marginal_rate=>9.3},
             {:bracket=>263222, :marginal_rate=>10.3},
             {:bracket=>315866, :marginal_rate=>11.3},
             {:bracket=>526443, :marginal_rate=>12.3},
             {:bracket=>1000000, :marginal_rate=>13.3}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>3992}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>15710, :marginal_rate=>2},
             {:bracket=>37221, :marginal_rate=>4},
             {:bracket=>47982, :marginal_rate=>6},
             {:bracket=>59383, :marginal_rate=>8},
             {:bracket=>70142, :marginal_rate=>9.3},
             {:bracket=>357981, :marginal_rate=>10.3},
             {:bracket=>429578, :marginal_rate=>11.3},
             {:bracket=>715962, :marginal_rate=>12.3},
             {:bracket=>1000000, :marginal_rate=>13.3}]}},
       :colorado=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>4.63}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>4.63}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>4.63}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>4.63}]}},
       :connecticut=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>10000, :marginal_rate=>5},
             {:bracket=>50000, :marginal_rate=>5.5},
             {:bracket=>100000, :marginal_rate=>6},
             {:bracket=>200000, :marginal_rate=>6.5},
             {:bracket=>250000, :marginal_rate=>6.9},
             {:bracket=>500000, :marginal_rate=>6.99}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>20000, :marginal_rate=>5},
             {:bracket=>100000, :marginal_rate=>5.5},
             {:bracket=>200000, :marginal_rate=>6},
             {:bracket=>400000, :marginal_rate=>6.5},
             {:bracket=>500000, :marginal_rate=>6.9},
             {:bracket=>1000000, :marginal_rate=>6.99}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>10000, :marginal_rate=>5},
             {:bracket=>50000, :marginal_rate=>5.5},
             {:bracket=>100000, :marginal_rate=>6},
             {:bracket=>200000, :marginal_rate=>6.5},
             {:bracket=>250000, :marginal_rate=>6.9},
             {:bracket=>500000, :marginal_rate=>6.99}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>16000, :marginal_rate=>5},
             {:bracket=>80000, :marginal_rate=>5.5},
             {:bracket=>160000, :marginal_rate=>6},
             {:bracket=>320000, :marginal_rate=>6.5},
             {:bracket=>400000, :marginal_rate=>6.9},
             {:bracket=>800000, :marginal_rate=>6.99}]}},
       :delaware=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>3250}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>2000, :marginal_rate=>2.2},
             {:bracket=>5000, :marginal_rate=>3.9},
             {:bracket=>10000, :marginal_rate=>4.8},
             {:bracket=>20000, :marginal_rate=>5.2},
             {:bracket=>25000, :marginal_rate=>5.55},
             {:bracket=>60000, :marginal_rate=>6.6}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>6500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>2000, :marginal_rate=>2.2},
             {:bracket=>5000, :marginal_rate=>3.9},
             {:bracket=>10000, :marginal_rate=>4.8},
             {:bracket=>20000, :marginal_rate=>5.2},
             {:bracket=>25000, :marginal_rate=>5.55},
             {:bracket=>60000, :marginal_rate=>6.6}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>3250}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>2000, :marginal_rate=>2.2},
             {:bracket=>5000, :marginal_rate=>3.9},
             {:bracket=>10000, :marginal_rate=>4.8},
             {:bracket=>20000, :marginal_rate=>5.2},
             {:bracket=>25000, :marginal_rate=>5.55},
             {:bracket=>60000, :marginal_rate=>6.6}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>3250}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>2000, :marginal_rate=>2.2},
             {:bracket=>5000, :marginal_rate=>3.9},
             {:bracket=>10000, :marginal_rate=>4.8},
             {:bracket=>20000, :marginal_rate=>5.2},
             {:bracket=>25000, :marginal_rate=>5.55},
             {:bracket=>60000, :marginal_rate=>6.6}]}},
       :district_of_columbia=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>5200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>10000, :marginal_rate=>6},
             {:bracket=>40000, :marginal_rate=>6.5},
             {:bracket=>60000, :marginal_rate=>8.5},
             {:bracket=>350000, :marginal_rate=>8.75},
             {:bracket=>1000000, :marginal_rate=>8.95}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>8350}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>10000, :marginal_rate=>6},
             {:bracket=>40000, :marginal_rate=>6.5},
             {:bracket=>60000, :marginal_rate=>8.5},
             {:bracket=>350000, :marginal_rate=>8.75},
             {:bracket=>1000000, :marginal_rate=>8.95}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>5200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>10000, :marginal_rate=>6},
             {:bracket=>40000, :marginal_rate=>6.5},
             {:bracket=>60000, :marginal_rate=>8.5},
             {:bracket=>350000, :marginal_rate=>8.75},
             {:bracket=>1000000, :marginal_rate=>8.95}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>5200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>10000, :marginal_rate=>6},
             {:bracket=>40000, :marginal_rate=>6.5},
             {:bracket=>60000, :marginal_rate=>8.5},
             {:bracket=>350000, :marginal_rate=>8.75},
             {:bracket=>1000000, :marginal_rate=>8.95}]}},
       :federal=>
        {:single=>
          {:income_tax_brackets=>
            [{:bracket=>0,
              :marginal_rate=>10,
              :marginal_capital_gain_rate=>0,
              :amount=>0},
             {:bracket=>9325,
              :marginal_rate=>15,
              :marginal_capital_gain_rate=>0,
              :amount=>932.5},
             {:bracket=>37950,
              :marginal_rate=>25,
              :marginal_capital_gain_rate=>15,
              :amount=>5226.25},
             {:bracket=>91900,
              :marginal_rate=>28,
              :marginal_capital_gain_rate=>15,
              :amount=>18713.75},
             {:bracket=>191650,
              :marginal_rate=>33,
              :marginal_capital_gain_rate=>15,
              :amount=>46643.75},
             {:bracket=>416700,
              :marginal_rate=>35,
              :marginal_capital_gain_rate=>15,
              :amount=>120910.25},
             {:bracket=>418400,
              :marginal_rate=>39.6,
              :marginal_capital_gain_rate=>20,
              :amount=>121505.25}],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6350}],
           :exemptions=>
            [{:exemption_name=>"Standard Exemption (Single)",
              :exemption_amount=>4050}]},
         :married=>
          {:income_tax_brackets=>
            [{:bracket=>0,
              :marginal_rate=>10,
              :marginal_capital_gain_rate=>0,
              :amount=>0},
             {:bracket=>18650,
              :marginal_rate=>15,
              :marginal_capital_gain_rate=>0,
              :amount=>1865},
             {:bracket=>75900,
              :marginal_rate=>25,
              :marginal_capital_gain_rate=>15,
              :amount=>10452.5},
             {:bracket=>153100,
              :marginal_rate=>28,
              :marginal_capital_gain_rate=>15,
              :amount=>29752.5},
             {:bracket=>233350,
              :marginal_rate=>33,
              :marginal_capital_gain_rate=>15,
              :amount=>52222.5},
             {:bracket=>416700,
              :marginal_rate=>35,
              :marginal_capital_gain_rate=>15,
              :amount=>112728},
             {:bracket=>470700,
              :marginal_rate=>39.6,
              :marginal_capital_gain_rate=>20,
              :amount=>131628}],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12700}],
           :exemptions=>
            [{:exemption_name=>"Standard Exemption (Single)",
              :exemption_amount=>4050}]},
         :married_separately=>
          {:income_tax_brackets=>
            [{:bracket=>0,
              :marginal_rate=>10,
              :marginal_capital_gain_rate=>0,
              :amount=>0},
             {:bracket=>9325,
              :marginal_rate=>15,
              :marginal_capital_gain_rate=>0,
              :amount=>932.5},
             {:bracket=>37950,
              :marginal_rate=>25,
              :marginal_capital_gain_rate=>15,
              :amount=>5226.25},
             {:bracket=>76550,
              :marginal_rate=>28,
              :marginal_capital_gain_rate=>15,
              :amount=>18713.75},
             {:bracket=>116675,
              :marginal_rate=>33,
              :marginal_capital_gain_rate=>15,
              :amount=>46643.75},
             {:bracket=>208350,
              :marginal_rate=>35,
              :marginal_capital_gain_rate=>15,
              :amount=>120910.25},
             {:bracket=>235350,
              :marginal_rate=>39.6,
              :marginal_capital_gain_rate=>20,
              :amount=>121505.25}],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Filing Separately)",
              :deduction_amount=>6350}],
           :exemptions=>
            [{:exemption_name=>"Standard Exemption (Single)",
              :exemption_amount=>4050}]},
         :head_of_household=>
          {:income_tax_brackets=>
            [{:bracket=>0,
              :marginal_rate=>10,
              :marginal_capital_gain_rate=>0,
              :amount=>0},
             {:bracket=>13350,
              :marginal_rate=>15,
              :marginal_capital_gain_rate=>0,
              :amount=>1335},
             {:bracket=>50800,
              :marginal_rate=>25,
              :marginal_capital_gain_rate=>15,
              :amount=>6952.5},
             {:bracket=>131200,
              :marginal_rate=>28,
              :marginal_capital_gain_rate=>15,
              :amount=>27052.5},
             {:bracket=>212500,
              :marginal_rate=>33,
              :marginal_capital_gain_rate=>15,
              :amount=>49816.5},
             {:bracket=>416700,
              :marginal_rate=>35,
              :marginal_capital_gain_rate=>15,
              :amount=>117202.5},
             {:bracket=>444500,
              :marginal_rate=>39.6,
              :marginal_capital_gain_rate=>20,
              :amount=>126950}],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head of Household)",
              :deduction_amount=>9350}],
           :exemptions=>
            [{:exemption_name=>"Standard Exemption (Single)",
              :exemption_amount=>4050}]}},
       :florida=>
        {:single=>{:type=>"none"},
         :married=>{:type=>"none"},
         :married_separately=>{:type=>"none"},
         :head_of_household=>{:type=>"none"}},
       :georgia=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>2300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>750, :marginal_rate=>2},
             {:bracket=>2250, :marginal_rate=>3},
             {:bracket=>3750, :marginal_rate=>4},
             {:bracket=>5250, :marginal_rate=>5},
             {:bracket=>7000, :marginal_rate=>6}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>3000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>1000, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>7000, :marginal_rate=>5},
             {:bracket=>10000, :marginal_rate=>6}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>3000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>750, :marginal_rate=>2},
             {:bracket=>2250, :marginal_rate=>3},
             {:bracket=>3750, :marginal_rate=>4},
             {:bracket=>5250, :marginal_rate=>5},
             {:bracket=>7000, :marginal_rate=>6}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>2300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>1000, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>7000, :marginal_rate=>5},
             {:bracket=>10000, :marginal_rate=>6}]}},
       :hawaii=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>2200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.4},
             {:bracket=>2400, :marginal_rate=>3.2},
             {:bracket=>4800, :marginal_rate=>5.5},
             {:bracket=>9600, :marginal_rate=>6.4},
             {:bracket=>14400, :marginal_rate=>6.8},
             {:bracket=>19200, :marginal_rate=>7.2},
             {:bracket=>24000, :marginal_rate=>7.6},
             {:bracket=>36000, :marginal_rate=>7.9},
             {:bracket=>48000, :marginal_rate=>8.25}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>4400}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.4},
             {:bracket=>4800, :marginal_rate=>3.2},
             {:bracket=>9600, :marginal_rate=>5.5},
             {:bracket=>19200, :marginal_rate=>6.4},
             {:bracket=>28800, :marginal_rate=>6.8},
             {:bracket=>38400, :marginal_rate=>7.2},
             {:bracket=>48000, :marginal_rate=>7.6},
             {:bracket=>72000, :marginal_rate=>7.9},
             {:bracket=>96000, :marginal_rate=>8.25}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>2200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.4},
             {:bracket=>2400, :marginal_rate=>3.2},
             {:bracket=>4800, :marginal_rate=>5.5},
             {:bracket=>9600, :marginal_rate=>6.4},
             {:bracket=>14400, :marginal_rate=>6.8},
             {:bracket=>19200, :marginal_rate=>7.2},
             {:bracket=>24000, :marginal_rate=>7.6},
             {:bracket=>36000, :marginal_rate=>7.9},
             {:bracket=>48000, :marginal_rate=>8.25}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>2200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.4},
             {:bracket=>3600, :marginal_rate=>3.2},
             {:bracket=>7200, :marginal_rate=>5.5},
             {:bracket=>14400, :marginal_rate=>6.4},
             {:bracket=>21600, :marginal_rate=>6.8},
             {:bracket=>28800, :marginal_rate=>7.2},
             {:bracket=>36000, :marginal_rate=>7.6},
             {:bracket=>54000, :marginal_rate=>7.9},
             {:bracket=>72000, :marginal_rate=>8.25}]}},
       :idaho=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.6},
             {:bracket=>1452, :marginal_rate=>3.6},
             {:bracket=>2940, :marginal_rate=>4.1},
             {:bracket=>4356, :marginal_rate=>5.1},
             {:bracket=>5808, :marginal_rate=>6.1},
             {:bracket=>7260, :marginal_rate=>7.1},
             {:bracket=>10890, :marginal_rate=>7.4}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.6},
             {:bracket=>2904, :marginal_rate=>3.6},
             {:bracket=>5808, :marginal_rate=>4.1},
             {:bracket=>8712, :marginal_rate=>5.1},
             {:bracket=>11616, :marginal_rate=>6.1},
             {:bracket=>14520, :marginal_rate=>7.1},
             {:bracket=>21780, :marginal_rate=>7.4}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.6},
             {:bracket=>1452, :marginal_rate=>3.6},
             {:bracket=>2940, :marginal_rate=>4.1},
             {:bracket=>4356, :marginal_rate=>5.1},
             {:bracket=>5808, :marginal_rate=>6.1},
             {:bracket=>7260, :marginal_rate=>7.1},
             {:bracket=>10890, :marginal_rate=>7.4}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.6},
             {:bracket=>2904, :marginal_rate=>3.6},
             {:bracket=>5808, :marginal_rate=>4.1},
             {:bracket=>8712, :marginal_rate=>5.1},
             {:bracket=>11616, :marginal_rate=>6.1},
             {:bracket=>14520, :marginal_rate=>7.1},
             {:bracket=>21780, :marginal_rate=>7.4}]}},
       :illinois=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.75}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.75}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.75}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.75}]}},
       :indiana=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.3}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.3}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.3}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.3}]}},
       :iowa=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>1970}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.36},
             {:bracket=>1554, :marginal_rate=>0.72},
             {:bracket=>3108, :marginal_rate=>2.43},
             {:bracket=>6216, :marginal_rate=>4.5},
             {:bracket=>13896, :marginal_rate=>6.12},
             {:bracket=>23310, :marginal_rate=>6.48},
             {:bracket=>31080, :marginal_rate=>6.8},
             {:bracket=>46620, :marginal_rate=>7.92},
             {:bracket=>69930, :marginal_rate=>8.98}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>4860}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.36},
             {:bracket=>1554, :marginal_rate=>0.72},
             {:bracket=>3108, :marginal_rate=>2.43},
             {:bracket=>6216, :marginal_rate=>4.5},
             {:bracket=>13896, :marginal_rate=>6.12},
             {:bracket=>23310, :marginal_rate=>6.48},
             {:bracket=>31080, :marginal_rate=>6.8},
             {:bracket=>46620, :marginal_rate=>7.92},
             {:bracket=>69930, :marginal_rate=>8.98}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>1970}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.36},
             {:bracket=>1554, :marginal_rate=>0.72},
             {:bracket=>3108, :marginal_rate=>2.43},
             {:bracket=>6216, :marginal_rate=>4.5},
             {:bracket=>13896, :marginal_rate=>6.12},
             {:bracket=>23310, :marginal_rate=>6.48},
             {:bracket=>31080, :marginal_rate=>6.8},
             {:bracket=>46620, :marginal_rate=>7.92},
             {:bracket=>69930, :marginal_rate=>8.98}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>1970}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.36},
             {:bracket=>1554, :marginal_rate=>0.72},
             {:bracket=>3108, :marginal_rate=>2.43},
             {:bracket=>6216, :marginal_rate=>4.5},
             {:bracket=>13896, :marginal_rate=>6.12},
             {:bracket=>23310, :marginal_rate=>6.48},
             {:bracket=>31080, :marginal_rate=>6.8},
             {:bracket=>46620, :marginal_rate=>7.92},
             {:bracket=>69930, :marginal_rate=>8.98}]}},
       :kansas=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>3000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.7},
             {:bracket=>15000, :marginal_rate=>4.6}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>7500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.7},
             {:bracket=>30000, :marginal_rate=>4.6}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>3000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.7},
             {:bracket=>15000, :marginal_rate=>4.6}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>3000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.7},
             {:bracket=>15000, :marginal_rate=>4.6}]}},
       :kentucky=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>2460}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>4000, :marginal_rate=>4},
             {:bracket=>5000, :marginal_rate=>5},
             {:bracket=>8000, :marginal_rate=>5.8},
             {:bracket=>75000, :marginal_rate=>6}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>2460}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>4000, :marginal_rate=>4},
             {:bracket=>5000, :marginal_rate=>5},
             {:bracket=>8000, :marginal_rate=>5.8},
             {:bracket=>75000, :marginal_rate=>6}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>2460}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>4000, :marginal_rate=>4},
             {:bracket=>5000, :marginal_rate=>5},
             {:bracket=>8000, :marginal_rate=>5.8},
             {:bracket=>75000, :marginal_rate=>6}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>2460}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>4000, :marginal_rate=>4},
             {:bracket=>5000, :marginal_rate=>5},
             {:bracket=>8000, :marginal_rate=>5.8},
             {:bracket=>75000, :marginal_rate=>6}]}},
       :louisiana=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>12500, :marginal_rate=>4},
             {:bracket=>50000, :marginal_rate=>6}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>25000, :marginal_rate=>4},
             {:bracket=>100000, :marginal_rate=>6}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>12500, :marginal_rate=>4},
             {:bracket=>50000, :marginal_rate=>6}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>12500, :marginal_rate=>4},
             {:bracket=>50000, :marginal_rate=>6}]}},
       :maine=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>11600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5.8},
             {:bracket=>21049, :marginal_rate=>6.75},
             {:bracket=>37499, :marginal_rate=>7.15}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>23200}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5.8},
             {:bracket=>42099, :marginal_rate=>6.75},
             {:bracket=>74999, :marginal_rate=>7.15}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>11600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5.8},
             {:bracket=>21049, :marginal_rate=>6.75},
             {:bracket=>37499, :marginal_rate=>7.15}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>11600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5.8},
             {:bracket=>21049, :marginal_rate=>6.75},
             {:bracket=>37499, :marginal_rate=>7.15}]}},
       :maryland=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>2000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>1000, :marginal_rate=>3},
             {:bracket=>2000, :marginal_rate=>4},
             {:bracket=>3000, :marginal_rate=>4.75},
             {:bracket=>100000, :marginal_rate=>5},
             {:bracket=>125000, :marginal_rate=>5.25},
             {:bracket=>150000, :marginal_rate=>5.5},
             {:bracket=>250000, :marginal_rate=>5.75}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>4000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>1000, :marginal_rate=>3},
             {:bracket=>2000, :marginal_rate=>4},
             {:bracket=>3000, :marginal_rate=>4.75},
             {:bracket=>150000, :marginal_rate=>5},
             {:bracket=>175000, :marginal_rate=>5.25},
             {:bracket=>225000, :marginal_rate=>5.5},
             {:bracket=>300000, :marginal_rate=>5.75}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>2000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>1000, :marginal_rate=>3},
             {:bracket=>2000, :marginal_rate=>4},
             {:bracket=>3000, :marginal_rate=>4.75},
             {:bracket=>100000, :marginal_rate=>5},
             {:bracket=>125000, :marginal_rate=>5.25},
             {:bracket=>150000, :marginal_rate=>5.5},
             {:bracket=>250000, :marginal_rate=>5.75}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>2000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>1000, :marginal_rate=>3},
             {:bracket=>2000, :marginal_rate=>4},
             {:bracket=>3000, :marginal_rate=>4.75},
             {:bracket=>150000, :marginal_rate=>5},
             {:bracket=>175000, :marginal_rate=>5.25},
             {:bracket=>225000, :marginal_rate=>5.5},
             {:bracket=>300000, :marginal_rate=>5.75}]}},
       :massachusetts=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5.1}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5.1}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5.1}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5.1}]}},
       :michigan=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>4.25}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>4.25}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>4.25}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>4.25}]}},
       :minnesota=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5.35},
             {:bracket=>25180, :marginal_rate=>7.05},
             {:bracket=>82740, :marginal_rate=>7.85},
             {:bracket=>155650, :marginal_rate=>9.85}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5.35},
             {:bracket=>36820, :marginal_rate=>7.05},
             {:bracket=>146270, :marginal_rate=>7.85},
             {:bracket=>259420, :marginal_rate=>9.85}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5.35},
             {:bracket=>18410, :marginal_rate=>7.05},
             {:bracket=>73140, :marginal_rate=>7.85},
             {:bracket=>129710, :marginal_rate=>9.85}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5.35},
             {:bracket=>31010, :marginal_rate=>7.05},
             {:bracket=>124600, :marginal_rate=>7.85},
             {:bracket=>207540, :marginal_rate=>9.85}]}},
       :mississippi=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>2300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>10000, :marginal_rate=>5}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>4600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>10000, :marginal_rate=>5}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>2300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>10000, :marginal_rate=>5}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>2300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>10000, :marginal_rate=>5}]}},
       :missouri=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.5},
             {:bracket=>1000, :marginal_rate=>2},
             {:bracket=>2000, :marginal_rate=>2.5},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>4000, :marginal_rate=>3.5},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>6000, :marginal_rate=>4.5},
             {:bracket=>7000, :marginal_rate=>5},
             {:bracket=>8000, :marginal_rate=>5.5},
             {:bracket=>9000, :marginal_rate=>6}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.5},
             {:bracket=>1000, :marginal_rate=>2},
             {:bracket=>2000, :marginal_rate=>2.5},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>4000, :marginal_rate=>3.5},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>6000, :marginal_rate=>4.5},
             {:bracket=>7000, :marginal_rate=>5},
             {:bracket=>8000, :marginal_rate=>5.5},
             {:bracket=>9000, :marginal_rate=>6}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.5},
             {:bracket=>1000, :marginal_rate=>2},
             {:bracket=>2000, :marginal_rate=>2.5},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>4000, :marginal_rate=>3.5},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>6000, :marginal_rate=>4.5},
             {:bracket=>7000, :marginal_rate=>5},
             {:bracket=>8000, :marginal_rate=>5.5},
             {:bracket=>9000, :marginal_rate=>6}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.5},
             {:bracket=>1000, :marginal_rate=>2},
             {:bracket=>2000, :marginal_rate=>2.5},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>4000, :marginal_rate=>3.5},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>6000, :marginal_rate=>4.5},
             {:bracket=>7000, :marginal_rate=>5},
             {:bracket=>8000, :marginal_rate=>5.5},
             {:bracket=>9000, :marginal_rate=>6}]}},
       :montana=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>4370}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>2900, :marginal_rate=>2},
             {:bracket=>5100, :marginal_rate=>3},
             {:bracket=>7800, :marginal_rate=>4},
             {:bracket=>10500, :marginal_rate=>5},
             {:bracket=>13500, :marginal_rate=>6},
             {:bracket=>17400, :marginal_rate=>6.9}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>8740}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>2900, :marginal_rate=>2},
             {:bracket=>5100, :marginal_rate=>3},
             {:bracket=>7800, :marginal_rate=>4},
             {:bracket=>10500, :marginal_rate=>5},
             {:bracket=>13500, :marginal_rate=>6},
             {:bracket=>17400, :marginal_rate=>6.9}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>4370}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>2900, :marginal_rate=>2},
             {:bracket=>5100, :marginal_rate=>3},
             {:bracket=>7800, :marginal_rate=>4},
             {:bracket=>10500, :marginal_rate=>5},
             {:bracket=>13500, :marginal_rate=>6},
             {:bracket=>17400, :marginal_rate=>6.9}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>4370}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1},
             {:bracket=>2900, :marginal_rate=>2},
             {:bracket=>5100, :marginal_rate=>3},
             {:bracket=>7800, :marginal_rate=>4},
             {:bracket=>10500, :marginal_rate=>5},
             {:bracket=>13500, :marginal_rate=>6},
             {:bracket=>17400, :marginal_rate=>6.9}]}},
       :nebraska=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.46},
             {:bracket=>3060, :marginal_rate=>3.51},
             {:bracket=>18370, :marginal_rate=>5.01},
             {:bracket=>29590, :marginal_rate=>6.84}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.46},
             {:bracket=>6120, :marginal_rate=>3.51},
             {:bracket=>36730, :marginal_rate=>5.01},
             {:bracket=>59180, :marginal_rate=>6.84}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.46},
             {:bracket=>3060, :marginal_rate=>3.51},
             {:bracket=>18370, :marginal_rate=>5.01},
             {:bracket=>29590, :marginal_rate=>6.84}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2.46},
             {:bracket=>5710, :marginal_rate=>3.51},
             {:bracket=>29390, :marginal_rate=>5.01},
             {:bracket=>43880, :marginal_rate=>6.84}]}},
       :nevada=>
        {:single=>{:type=>"none"},
         :married=>{:type=>"none"},
         :married_separately=>{:type=>"none"},
         :head_of_household=>{:type=>"none"}},
       :new_hampshire=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5}]}},
       :new_jersey=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.4},
             {:bracket=>20000, :marginal_rate=>1.75},
             {:bracket=>35000, :marginal_rate=>3.5},
             {:bracket=>40000, :marginal_rate=>5.525},
             {:bracket=>75000, :marginal_rate=>6.37},
             {:bracket=>500000, :marginal_rate=>8.97}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.4},
             {:bracket=>20000, :marginal_rate=>1.75},
             {:bracket=>50000, :marginal_rate=>2.45},
             {:bracket=>70000, :marginal_rate=>3.5},
             {:bracket=>80000, :marginal_rate=>5.525},
             {:bracket=>150000, :marginal_rate=>6.37},
             {:bracket=>500000, :marginal_rate=>8.97}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.4},
             {:bracket=>20000, :marginal_rate=>1.75},
             {:bracket=>35000, :marginal_rate=>3.5},
             {:bracket=>40000, :marginal_rate=>5.525},
             {:bracket=>75000, :marginal_rate=>6.37},
             {:bracket=>500000, :marginal_rate=>8.97}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.4},
             {:bracket=>20000, :marginal_rate=>1.75},
             {:bracket=>50000, :marginal_rate=>2.45},
             {:bracket=>70000, :marginal_rate=>3.5},
             {:bracket=>80000, :marginal_rate=>5.525},
             {:bracket=>150000, :marginal_rate=>6.37},
             {:bracket=>500000, :marginal_rate=>8.97}]}},
       :new_mexico=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.7},
             {:bracket=>5500, :marginal_rate=>3.2},
             {:bracket=>11000, :marginal_rate=>4.7},
             {:bracket=>16000, :marginal_rate=>4.9}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.7},
             {:bracket=>8000, :marginal_rate=>3.2},
             {:bracket=>16000, :marginal_rate=>4.7},
             {:bracket=>24000, :marginal_rate=>4.9}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.7},
             {:bracket=>4000, :marginal_rate=>3.2},
             {:bracket=>8000, :marginal_rate=>4.7},
             {:bracket=>12000, :marginal_rate=>4.9}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.7},
             {:bracket=>8000, :marginal_rate=>3.2},
             {:bracket=>16000, :marginal_rate=>4.7},
             {:bracket=>24000, :marginal_rate=>4.9}]}},
       :new_york=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>7950}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>8450, :marginal_rate=>4.5},
             {:bracket=>11650, :marginal_rate=>5.25},
             {:bracket=>13850, :marginal_rate=>5.9},
             {:bracket=>21300, :marginal_rate=>6.45},
             {:bracket=>80150, :marginal_rate=>6.65},
             {:bracket=>214000, :marginal_rate=>6.85},
             {:bracket=>1070350, :marginal_rate=>8.82}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>15950}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>17050, :marginal_rate=>4.5},
             {:bracket=>23450, :marginal_rate=>5.25},
             {:bracket=>27750, :marginal_rate=>5.9},
             {:bracket=>42750, :marginal_rate=>6.45},
             {:bracket=>160500, :marginal_rate=>6.65},
             {:bracket=>321050, :marginal_rate=>6.85},
             {:bracket=>2140900, :marginal_rate=>8.82}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>7950}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>8450, :marginal_rate=>4.5},
             {:bracket=>11650, :marginal_rate=>5.25},
             {:bracket=>13850, :marginal_rate=>5.9},
             {:bracket=>21300, :marginal_rate=>6.45},
             {:bracket=>80150, :marginal_rate=>6.65},
             {:bracket=>214000, :marginal_rate=>6.85},
             {:bracket=>1070350, :marginal_rate=>8.82}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>11100}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>8450, :marginal_rate=>4.5},
             {:bracket=>11650, :marginal_rate=>5.25},
             {:bracket=>13850, :marginal_rate=>5.9},
             {:bracket=>21300, :marginal_rate=>6.45},
             {:bracket=>80150, :marginal_rate=>6.65},
             {:bracket=>214000, :marginal_rate=>6.85},
             {:bracket=>1070350, :marginal_rate=>8.82}]}},
       :north_carolina=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>7500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5.75}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>15000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5.75}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>7500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5.75}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>7500}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5.75}]}},
       :north_dakota=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.1},
             {:bracket=>37450, :marginal_rate=>2.04},
             {:bracket=>90750, :marginal_rate=>2.27},
             {:bracket=>189300, :marginal_rate=>2.64},
             {:bracket=>411500, :marginal_rate=>2.9}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.1},
             {:bracket=>62600, :marginal_rate=>2.04},
             {:bracket=>151200, :marginal_rate=>2.27},
             {:bracket=>230450, :marginal_rate=>2.64},
             {:bracket=>411500, :marginal_rate=>2.9}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.1},
             {:bracket=>31300, :marginal_rate=>2.04},
             {:bracket=>75600, :marginal_rate=>2.27},
             {:bracket=>115225, :marginal_rate=>2.64},
             {:bracket=>205750, :marginal_rate=>2.9}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>1.1},
             {:bracket=>50200, :marginal_rate=>2.04},
             {:bracket=>129650, :marginal_rate=>2.27},
             {:bracket=>209850, :marginal_rate=>2.64},
             {:bracket=>411500, :marginal_rate=>2.9}]}},
       :ohio=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.495},
             {:bracket=>5200, :marginal_rate=>0.99},
             {:bracket=>10400, :marginal_rate=>1.98},
             {:bracket=>15650, :marginal_rate=>2.476},
             {:bracket=>20900, :marginal_rate=>2.969},
             {:bracket=>41700, :marginal_rate=>3.465},
             {:bracket=>83350, :marginal_rate=>3.96},
             {:bracket=>104250, :marginal_rate=>4.597},
             {:bracket=>208500, :marginal_rate=>4.997}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.495},
             {:bracket=>5200, :marginal_rate=>0.99},
             {:bracket=>10400, :marginal_rate=>1.98},
             {:bracket=>15650, :marginal_rate=>2.476},
             {:bracket=>20900, :marginal_rate=>2.969},
             {:bracket=>41700, :marginal_rate=>3.465},
             {:bracket=>83350, :marginal_rate=>3.96},
             {:bracket=>104250, :marginal_rate=>4.597},
             {:bracket=>208500, :marginal_rate=>4.997}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.495},
             {:bracket=>5200, :marginal_rate=>0.99},
             {:bracket=>10400, :marginal_rate=>1.98},
             {:bracket=>15650, :marginal_rate=>2.476},
             {:bracket=>20900, :marginal_rate=>2.969},
             {:bracket=>41700, :marginal_rate=>3.465},
             {:bracket=>83350, :marginal_rate=>3.96},
             {:bracket=>104250, :marginal_rate=>4.597},
             {:bracket=>208500, :marginal_rate=>4.997}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.495},
             {:bracket=>5200, :marginal_rate=>0.99},
             {:bracket=>10400, :marginal_rate=>1.98},
             {:bracket=>15650, :marginal_rate=>2.476},
             {:bracket=>20900, :marginal_rate=>2.969},
             {:bracket=>41700, :marginal_rate=>3.465},
             {:bracket=>83350, :marginal_rate=>3.96},
             {:bracket=>104250, :marginal_rate=>4.597},
             {:bracket=>208500, :marginal_rate=>4.997}]}},
       :oklahoma=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.5},
             {:bracket=>1000, :marginal_rate=>1},
             {:bracket=>2500, :marginal_rate=>2},
             {:bracket=>3750, :marginal_rate=>3},
             {:bracket=>4900, :marginal_rate=>4},
             {:bracket=>7200, :marginal_rate=>5}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.5},
             {:bracket=>2000, :marginal_rate=>1},
             {:bracket=>5000, :marginal_rate=>2},
             {:bracket=>7500, :marginal_rate=>3},
             {:bracket=>9800, :marginal_rate=>4},
             {:bracket=>12200, :marginal_rate=>5}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.5},
             {:bracket=>1000, :marginal_rate=>1},
             {:bracket=>2500, :marginal_rate=>2},
             {:bracket=>3750, :marginal_rate=>3},
             {:bracket=>4900, :marginal_rate=>4},
             {:bracket=>7200, :marginal_rate=>5}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0.5},
             {:bracket=>2000, :marginal_rate=>1},
             {:bracket=>5000, :marginal_rate=>2},
             {:bracket=>7500, :marginal_rate=>3},
             {:bracket=>9800, :marginal_rate=>4},
             {:bracket=>12200, :marginal_rate=>5},
             {:bracket=>15000, :marginal_rate=>5.25}]}},
       :oregon=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>2145}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5},
             {:bracket=>3350, :marginal_rate=>7},
             {:bracket=>8400, :marginal_rate=>9},
             {:bracket=>125000, :marginal_rate=>9.9}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>4295}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5},
             {:bracket=>6500, :marginal_rate=>7},
             {:bracket=>16300, :marginal_rate=>9},
             {:bracket=>250000, :marginal_rate=>9.9}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>2145}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5},
             {:bracket=>3350, :marginal_rate=>7},
             {:bracket=>8400, :marginal_rate=>9},
             {:bracket=>125000, :marginal_rate=>9.9}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>2145}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>5},
             {:bracket=>6500, :marginal_rate=>7},
             {:bracket=>16300, :marginal_rate=>9},
             {:bracket=>250000, :marginal_rate=>9.9}]}},
       :pennsylvania=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.07}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.07}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.07}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>3.07}]}},
       :rhode_island=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>8300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3.75},
             {:bracket=>60850, :marginal_rate=>4.75},
             {:bracket=>138300, :marginal_rate=>5.99}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>16600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3.75},
             {:bracket=>60850, :marginal_rate=>4.75},
             {:bracket=>138300, :marginal_rate=>5.99}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>8300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3.75},
             {:bracket=>60850, :marginal_rate=>4.75},
             {:bracket=>138300, :marginal_rate=>5.99}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>8300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3.75},
             {:bracket=>60850, :marginal_rate=>4.75},
             {:bracket=>138300, :marginal_rate=>5.99}]}},
       :south_carolina=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0},
             {:bracket=>2920, :marginal_rate=>3},
             {:bracket=>5840, :marginal_rate=>4},
             {:bracket=>8760, :marginal_rate=>5},
             {:bracket=>11680, :marginal_rate=>6},
             {:bracket=>14600, :marginal_rate=>7}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>112600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0},
             {:bracket=>2920, :marginal_rate=>3},
             {:bracket=>5840, :marginal_rate=>4},
             {:bracket=>8760, :marginal_rate=>5},
             {:bracket=>11680, :marginal_rate=>6},
             {:bracket=>14600, :marginal_rate=>7}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0},
             {:bracket=>2920, :marginal_rate=>3},
             {:bracket=>5840, :marginal_rate=>4},
             {:bracket=>8760, :marginal_rate=>5},
             {:bracket=>11680, :marginal_rate=>6},
             {:bracket=>14600, :marginal_rate=>7}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>0},
             {:bracket=>2920, :marginal_rate=>3},
             {:bracket=>5840, :marginal_rate=>4},
             {:bracket=>8760, :marginal_rate=>5},
             {:bracket=>11680, :marginal_rate=>6},
             {:bracket=>14600, :marginal_rate=>7}]}},
       :south_dakota=>
        {:single=>{:type=>"none"},
         :married=>{:type=>"none"},
         :married_separately=>{:type=>"none"},
         :head_of_household=>{:type=>"none"}},
       :tennessee=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>6}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>6}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>6}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>6}]}},
       :texas=>
        {:single=>{:type=>"none"},
         :married=>{:type=>"none"},
         :married_separately=>{:type=>"none"},
         :head_of_household=>{:type=>"none"}},
       :utah=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>[{:bracket=>0, :marginal_rate=>5}]}},
       :vermont=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3.55},
             {:bracket=>39900, :marginal_rate=>6.8},
             {:bracket=>93400, :marginal_rate=>7.8},
             {:bracket=>192400, :marginal_rate=>8.8},
             {:bracket=>415600, :marginal_rate=>8.95}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>12600}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3.55},
             {:bracket=>69900, :marginal_rate=>6.8},
             {:bracket=>160450, :marginal_rate=>7.8},
             {:bracket=>240000, :marginal_rate=>8.8},
             {:bracket=>421900, :marginal_rate=>8.95}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3.55},
             {:bracket=>39900, :marginal_rate=>6.8},
             {:bracket=>93400, :marginal_rate=>7.8},
             {:bracket=>192400, :marginal_rate=>8.8},
             {:bracket=>415600, :marginal_rate=>8.95}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>6300}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3.55},
             {:bracket=>39900, :marginal_rate=>6.8},
             {:bracket=>93400, :marginal_rate=>7.8},
             {:bracket=>192400, :marginal_rate=>8.8},
             {:bracket=>415600, :marginal_rate=>8.95}]}},
       :virginia=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>3000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>5},
             {:bracket=>17000, :marginal_rate=>5.75}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>6000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>5},
             {:bracket=>17000, :marginal_rate=>5.75}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>3000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>5},
             {:bracket=>17000, :marginal_rate=>5.75}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>3000}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>2},
             {:bracket=>3000, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>5},
             {:bracket=>17000, :marginal_rate=>5.75}]}},
       :washington=>
        {:single=>{:type=>"none"},
         :married=>{:type=>"none"},
         :married_separately=>{:type=>"none"},
         :head_of_household=>{:type=>"none"}},
       :west_virginia=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>10000, :marginal_rate=>4},
             {:bracket=>25000, :marginal_rate=>4.5},
             {:bracket=>40000, :marginal_rate=>6},
             {:bracket=>60000, :marginal_rate=>6.5}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>10000, :marginal_rate=>4},
             {:bracket=>25000, :marginal_rate=>4.5},
             {:bracket=>40000, :marginal_rate=>6},
             {:bracket=>60000, :marginal_rate=>6.5}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>5000, :marginal_rate=>4},
             {:bracket=>12500, :marginal_rate=>4.5},
             {:bracket=>20000, :marginal_rate=>6},
             {:bracket=>30000, :marginal_rate=>6.5}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>[],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>3},
             {:bracket=>10000, :marginal_rate=>4},
             {:bracket=>25000, :marginal_rate=>4.5},
             {:bracket=>40000, :marginal_rate=>6},
             {:bracket=>60000, :marginal_rate=>6.5}]}},
       :wisconsin=>
        {:single=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Single)",
              :deduction_amount=>10270}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>11150, :marginal_rate=>5.84},
             {:bracket=>22230, :marginal_rate=>6.27},
             {:bracket=>244750, :marginal_rate=>7.65}]},
         :married=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married)",
              :deduction_amount=>19010}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>14820, :marginal_rate=>5.84},
             {:bracket=>29640, :marginal_rate=>6.27},
             {:bracket=>326330, :marginal_rate=>7.65}]},
         :married_separately=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Married Separately)",
              :deduction_amount=>10270}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>11150, :marginal_rate=>5.84},
             {:bracket=>22230, :marginal_rate=>6.27},
             {:bracket=>244750, :marginal_rate=>7.65}]},
         :head_of_household=>
          {:specialtaxes=>[],
           :deductions=>
            [{:deduction_name=>"Standard Deduction (Head Of Household)",
              :deduction_amount=>10270}],
           :credits=>[],
           :annotations=>[],
           :income_tax_brackets=>
            [{:bracket=>0, :marginal_rate=>4},
             {:bracket=>11150, :marginal_rate=>5.84},
             {:bracket=>22230, :marginal_rate=>6.27},
             {:bracket=>244750, :marginal_rate=>7.65}]}},
       :wyoming=>
        {:single=>{:type=>"none"},
         :married=>{:type=>"none"},
         :married_separately=>{:type=>"none"},
         :head_of_household=>{:type=>"none"}}}
  end
end