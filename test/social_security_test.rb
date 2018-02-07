require 'test_helper'

class SocialSecurityTest < MiniTest::Test

  def atest_social_security
    primary_calc = FortuneTeller::Utils::SocialSecurity.new(dob: Date.new(1959, 2, 1))
    primary_calc.set_salary_data(current_salary: 100_000_00, annual_raise: 1.03)
    
    partner_calc = FortuneTeller::Utils::SocialSecurity.new(dob: Date.new(1961, 5, 5))
    partner_calc.set_salary_data(current_salary: 60_000_00, annual_raise: 1.03)    

    primary_all = primary_calc.calculate_all_benefits
    partner_all = partner_calc.calculate_all_benefits

    # s_ means will be passed in as partner_calc
    s_primary_calc = FortuneTeller::Utils::SocialSecurity.new(dob: Date.new(1959, 2, 1))
    s_primary_calc.set_salary_data(current_salary: 100_000_00, annual_raise: 1.03)
    
    s_partner_calc = FortuneTeller::Utils::SocialSecurity.new(dob: Date.new(1961, 5, 5))
    s_partner_calc.set_salary_data(current_salary: 60_000_00, annual_raise: 1.03)

    s_primary_as_primary_all = s_primary_calc.calculate_all_benefits(partner_calc: partner_calc)
    s_partner_as_primary_all = s_partner_calc.calculate_all_benefits(partner_calc: primary_calc)

    #test permutations
    assert_equal s_primary_as_primary_all[:primary], s_partner_as_primary_all[:partner]
    assert_equal s_primary_as_primary_all[:partner], s_partner_as_primary_all[:primary]

    assert_equal s_primary_as_primary_all[:primary], primary_all[:primary]
    assert_equal s_primary_as_primary_all[:partner], partner_all[:primary]
  end

  def test_social_security_spousal
    primary_calc = FortuneTeller::Utils::SocialSecurity.new(dob: Date.new(1961, 5, 5))
    primary_calc.set_salary_data(current_salary: 100_000_00, annual_raise: 1.03)
    
    partner_calc = FortuneTeller::Utils::SocialSecurity.new(dob: Date.new(1961, 5, 5))
    partner_calc.set_salary_data(current_salary: 20_000_00, annual_raise: 1.03)

    month = Date.new(2028, 5, 1)

    partner_benefit_a = partner_calc.calculate_benefit(start_month: month, partner_calc: primary_calc)
    partner_benefit_b = partner_calc.calculate_benefit(start_month: month, partner_calc: nil)

    assert_equal partner_benefit_a, {:amount=>169833, :type=>:spousal}
    assert_equal partner_benefit_b, {:amount=>135988, :type=>:personal}
  end
end