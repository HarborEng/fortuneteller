require 'test_helper'

class AcceptanceTest < Minitest::Test

  def expected_no_reallocation
    [
      {:date => Date.parse("2017-12-14"), :accounts => {"AA" => 50000000,"AD" => 20000000}},
      {:date => Date.parse("2018-01-01"), :accounts => {"AA" => 50125051,"AD" => 20057553}},
      {:date => Date.parse("2019-01-01"), :accounts => {"AA" => 53764116,"AD" => 22035261}},
      {:date => Date.parse("2020-01-01"), :accounts => {"AA" => 57605493,"AD" => 24131633}},
      {:date => Date.parse("2021-01-01"), :accounts => {"AA" => 61669213,"AD" => 26357891}},
      {:date => Date.parse("2022-01-01"), :accounts => {"AA" => 65950837,"AD" => 28713621}},
      {:date => Date.parse("2023-01-01"), :accounts => {"AA" => 70471326,"AD" => 31210694}},
      {:date => Date.parse("2024-01-01"), :accounts => {"AA" => 75244286,"AD" => 33857592}},
      {:date => Date.parse("2025-01-01"), :accounts => {"AA" => 80295425,"AD" => 36669054}},
      {:date => Date.parse("2026-01-01"), :accounts => {"AA" => 85617984,"AD" => 39643454}},
      {:date => Date.parse("2027-01-01"), :accounts => {"AA" => 91238794,"AD" => 42796318}},
      {:date => Date.parse("2028-01-01"), :accounts => {"AA" => 97174911,"AD" => 46138353}},
      {:date => Date.parse("2029-01-01"), :accounts => {"AA" => 103459138,"AD" => 49688739}},
      {:date => Date.parse("2030-01-01"), :accounts => {"AA" => 110081852,"AD" => 53444320}},
      {:date => Date.parse("2031-01-01"), :accounts => {"AA" => 117077240,"AD" => 57425236}},
      {:date => Date.parse("2032-01-01"), :accounts => {"AA" => 121572457,"AD" => 61645006}},
      {:date => Date.parse("2033-01-01"), :accounts => {"AA" => 125596275,"AD" => 66128413}},
      {:date => Date.parse("2034-01-01"), :accounts => {"AA" => 127172496,"AD" => 70359225}},
      {:date => Date.parse("2035-01-01"), :accounts => {"AA" => 127427030,"AD" => 74580778}},
      {:date => Date.parse("2036-01-01"), :accounts => {"AA" => 127571155,"AD" => 79055625}},
      {:date => Date.parse("2037-01-01"), :accounts => {"AA" => 127615576,"AD" => 83812341}},
      {:date => Date.parse("2038-01-01"), :accounts => {"AA" => 127513118,"AD" => 88841081}},
      {:date => Date.parse("2039-01-01"), :accounts => {"AA" => 127272306,"AD" => 94171546}},
      {:date => Date.parse("2040-01-01"), :accounts => {"AA" => 126882598,"AD" => 99821839}},
      {:date => Date.parse("2041-01-01"), :accounts => {"AA" => 126352254,"AD" => 105828042}},
      {:date => Date.parse("2042-01-01"), :accounts => {"AA" => 125631530,"AD" => 112177725}},
      {:date => Date.parse("2043-01-01"), :accounts => {"AA" => 124726181,"AD" => 118908388}},
      {:date => Date.parse("2044-01-01"), :accounts => {"AA" => 123622754,"AD" => 126042891}},
      {:date => Date.parse("2045-01-01"), :accounts => {"AA" => 122325981,"AD" => 133626795}},
      {:date => Date.parse("2046-01-01"), :accounts => {"AA" => 120783694,"AD" => 141644403}},
      {:date => Date.parse("2047-01-01"), :accounts => {"AA" => 118997770,"AD" => 150143067}},
      {:date => Date.parse("2048-01-01"), :accounts => {"AA" => 116951061,"AD" => 159151651}},
      {:date => Date.parse("2049-01-01"), :accounts => {"AA" => 114643429,"AD" => 168727684}},
      {:date => Date.parse("2050-01-01"), :accounts => {"AA" => 112020436,"AD" => 178851345}},
      {:date => Date.parse("2051-01-01"), :accounts => {"AA" => 109078659,"AD" => 189582426}},
      {:date => Date.parse("2052-01-01"), :accounts => {"AA" => 105796321,"AD" => 200957372}},
      {:date => Date.parse("2053-01-01"), :accounts => {"AA" => 102166647,"AD" => 213048823}},
      {:date => Date.parse("2054-01-01"), :accounts => {"AA" => 98133273,"AD" => 225831752}},
      {:date => Date.parse("2055-01-01"), :accounts => {"AA" => 93685625,"AD" => 239381657}},
      {:date => Date.parse("2056-01-01"), :accounts => {"AA" => 88796027,"AD" => 253744556}},
      {:date => Date.parse("2057-01-01"), :accounts => {"AA" => 83448890,"AD" => 269012171}},
      {:date => Date.parse("2058-01-01"), :accounts => {"AA" => 77586341,"AD" => 285152901}},
      {:date => Date.parse("2059-01-01"), :accounts => {"AA" => 71188324,"AD" => 302262075}},
      {:date => Date.parse("2060-01-01"), :accounts => {"AA" => 64219768,"AD" => 320397799}},
      {:date => Date.parse("2061-01-01"), :accounts => {"AA" => 56653350,"AD" => 339675889}},
      {:date => Date.parse("2062-01-01"), :accounts => {"AA" => 48430361,"AD" => 360056442}},
      {:date => Date.parse("2063-01-01"), :accounts => {"AA" => 39518267,"AD" => 381659829}},
      {:date => Date.parse("2064-01-01"), :accounts => {"AA" => 29872660,"AD" => 404559419}},
      {:date => Date.parse("2065-01-01"), :accounts => {"AA" => 19450843,"AD" => 428901449}}
    ]
  end

  def expected_5050_reallocation
    [
      {:date => Date.parse("2017-12-14"), :accounts => {"AA" => 50000000, "AD" => 20000000}},
      {:date => Date.parse("2018-01-01"), :accounts => {"AA" => 50120343, "AD" => 20048137}},
      {:date => Date.parse("2019-01-01"), :accounts => {"AA" => 53658697, "AD" => 21824801}},
      {:date => Date.parse("2020-01-01"), :accounts => {"AA" => 57373970, "AD" => 23690299}},
      {:date => Date.parse("2021-01-01"), :accounts => {"AA" => 61283093, "AD" => 25652420}},
      {:date => Date.parse("2022-01-01"), :accounts => {"AA" => 65379584, "AD" => 27709296}},
      {:date => Date.parse("2023-01-01"), :accounts => {"AA" => 69680900, "AD" => 29869018}},
      {:date => Date.parse("2024-01-01"), :accounts => {"AA" => 74197283, "AD" => 32136725}},
      {:date => Date.parse("2025-01-01"), :accounts => {"AA" => 78949937, "AD" => 34522354}},
      {:date => Date.parse("2026-01-01"), :accounts => {"AA" => 83929771, "AD" => 37022729}},
      {:date => Date.parse("2027-01-01"), :accounts => {"AA" => 89158599, "AD" => 39648124}},
      {:date => Date.parse("2028-01-01"), :accounts => {"AA" => 94648869, "AD" => 42404788}},
      {:date => Date.parse("2029-01-01"), :accounts => {"AA" => 100426977, "AD" => 45305261}},
      {:date => Date.parse("2030-01-01"), :accounts => {"AA" => 106480662, "AD" => 48344780}},
      {:date => Date.parse("2031-01-01"), :accounts => {"AA" => 112837032, "AD" => 51536274}},
      {:date => Date.parse("2032-01-01"), :accounts => {"AA" => 116620853, "AD" => 54887342}},
      {:date => Date.parse("2033-01-01"), :accounts => {"AA" => 119867874, "AD" => 58413699}},
      {:date => Date.parse("2034-01-01"), :accounts => {"AA" => 120607868, "AD" => 61597491}},
      {:date => Date.parse("2035-01-01"), :accounts => {"AA" => 119973012, "AD" => 64677367}},
      {:date => Date.parse("2036-01-01"), :accounts => {"AA" => 119173106, "AD" => 67911236}},
      {:date => Date.parse("2037-01-01"), :accounts => {"AA" => 118213817, "AD" => 71316339}},
      {:date => Date.parse("2038-01-01"), :accounts => {"AA" => 117051285, "AD" => 74882157}},
      {:date => Date.parse("2039-01-01"), :accounts => {"AA" => 115689161, "AD" => 78626266}},
      {:date => Date.parse("2040-01-01"), :accounts => {"AA" => 114114633, "AD" => 82557579}},
      {:date => Date.parse("2041-01-01"), :accounts => {"AA" => 112330075, "AD" => 86697058}},
      {:date => Date.parse("2042-01-01"), :accounts => {"AA" => 110290297, "AD" => 91031911}},
      {:date => Date.parse("2043-01-01"), :accounts => {"AA" => 107995405, "AD" => 95583507}},
      {:date => Date.parse("2044-01-01"), :accounts => {"AA" => 105429573, "AD" => 100362683}},
      {:date => Date.parse("2045-01-01"), :accounts => {"AA" => 102590770, "AD" => 105394919}},
      {:date => Date.parse("2046-01-01"), :accounts => {"AA" => 99432905, "AD" => 110664666}},
      {:date => Date.parse("2047-01-01"), :accounts => {"AA" => 95951401, "AD" => 116197899}},
      {:date => Date.parse("2048-01-01"), :accounts => {"AA" => 92126765, "AD" => 122007795}},
      {:date => Date.parse("2049-01-01"), :accounts => {"AA" => 87951188, "AD" => 128125328}},
      {:date => Date.parse("2050-01-01"), :accounts => {"AA" => 83378187, "AD" => 134531595}},
      {:date => Date.parse("2051-01-01"), :accounts => {"AA" => 78397126, "AD" => 141258176}},
      {:date => Date.parse("2052-01-01"), :accounts => {"AA" => 72984027, "AD" => 148321085}},
      {:date => Date.parse("2053-01-01"), :accounts => {"AA" => 67123637, "AD" => 155757979}},
      {:date => Date.parse("2054-01-01"), :accounts => {"AA" => 60769810, "AD" => 163545879}},
      {:date => Date.parse("2055-01-01"), :accounts => {"AA" => 53904088, "AD" => 171723174}},
      {:date => Date.parse("2056-01-01"), :accounts => {"AA" => 46496986, "AD" => 180309332}},
      {:date => Date.parse("2057-01-01"), :accounts => {"AA" => 38523787, "AD" => 189350131}},
      {:date => Date.parse("2058-01-01"), :accounts => {"AA" => 29939549, "AD" => 198817639}},
      {:date => Date.parse("2059-01-01"), :accounts => {"AA" => 20715891, "AD" => 208758522}},
      {:date => Date.parse("2060-01-01"), :accounts => {"AA" => 10816637, "AD" => 219196448}},
      {:date => Date.parse("2061-01-01"), :accounts => {"AA" => 204985, "AD" => 230187066}},
      {:date => Date.parse("2062-01-01"), :accounts => {"AA" => 0, "AD" => 230534828}},
      {:date => Date.parse("2063-01-01"), :accounts => {"AA" => 0, "AD" => 230457195}},
      {:date => Date.parse("2064-01-01"), :accounts => {"AA" => 0, "AD" => 230143605}},
      {:date => Date.parse("2065-01-01"), :accounts => {"AA" => 0, "AD" => 229609661}}
    ]
  end

  def test_expected_results
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      FortuneTeller::Benchmark.run
    end

    result.zip(expected_no_reallocation) do |actual, expected|
      assert_equal actual, expected
    end
  end

  def test_expected_results_nil_allocation
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      sim = FortuneTeller::Benchmark.create_sim
      sim.add_allocation_strategy(allocations: [nil])
      context = FortuneTeller::Benchmark.default_context
      sim.simulate(**context)
    end

    result.zip(expected_no_reallocation) do |actual, expected|
      assert_equal actual, expected
    end
  end

  def test_expected_results_5050_allocation
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      sim = FortuneTeller::Benchmark.create_sim
      sim.add_allocation_strategy(allocations: [{stocks: 5000, bonds: 5000}])
      context = FortuneTeller::Benchmark.default_context
      sim.simulate(**context)
    end

    result.zip(expected_5050_reallocation) do |actual, expected|
      assert_equal actual, expected
    end
  end

  def test_state_independence
    # create two sims, run one first through a set of crazy params, and
    # then both through the same params. the results should match up.
    sim1 = FortuneTeller::Benchmark.create_sim
    sim2 = FortuneTeller::Benchmark.create_sim

    sim1.simulate(growth_rates:
      {
        stocks:       [1.15],
        bonds:        [1.45],
        wage_growth:  [1.30],
        inflation:    [1.12]
      }
    )

    res1 = sim1.simulate(
      growth_rates: {
        stocks:       [1.05],
        bonds:        [1.05],
        wage_growth:  [1.00],
        inflation:    [1.02]
      }
    ).as_json

    res2 = sim2.simulate(
      growth_rates: {
        stocks:       [1.05],
        bonds:        [1.05],
        wage_growth:  [1.00],
        inflation:    [1.02]
      }
    ).as_json

    res1.zip(res2).each do |line1, line2|
      assert_equal line1, line2
    end
  end
end
