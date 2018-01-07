require 'test_helper'

class AcceptanceTest < Minitest::Test

  def expected_no_reallocation
    [
      {:date=> Date.parse('2017-12-14'), :accounts=>{"AA"=>50000000, "AD"=>20000000}},
      {:date=> Date.parse('2018-01-01'), :accounts=>{"AA"=>50120450, "AD"=>20048180}},
      {:date=> Date.parse('2019-01-01'), :accounts=>{"AA"=>53653458, "AD"=>21820831}},
      {:date=> Date.parse('2020-01-01'), :accounts=>{"AA"=>57363119, "AD"=>23682114}},
      {:date=> Date.parse('2021-01-01'), :accounts=>{"AA"=>61266336, "AD"=>25639805}},
      {:date=> Date.parse('2022-01-01'), :accounts=>{"AA"=>65356639, "AD"=>27692038}},
      {:date=> Date.parse('2023-01-01'), :accounts=>{"AA"=>69651456, "AD"=>29846882}},
      {:date=> Date.parse('2024-01-01'), :accounts=>{"AA"=>74161015, "AD"=>32109468}},
      {:date=> Date.parse('2025-01-01'), :accounts=>{"AA"=>78906486, "AD"=>34489709}},
      {:date=> Date.parse('2026-01-01'), :accounts=>{"AA"=>83878796, "AD"=>36984438}},
      {:date=> Date.parse('2027-01-01'), :accounts=>{"AA"=>89099722, "AD"=>39603901}},
      {:date=> Date.parse('2028-01-01'), :accounts=>{"AA"=>94581694, "AD"=>42354339}},
      {:date=> Date.parse('2029-01-01'), :accounts=>{"AA"=>100351063, "AD"=>45248262}},
      {:date=> Date.parse('2030-01-01'), :accounts=>{"AA"=>106395601, "AD"=>48280917}},
      {:date=> Date.parse('2031-01-01'), :accounts=>{"AA"=>112742368, "AD"=>51465204}},
      {:date=> Date.parse('2032-01-01'), :accounts=>{"AA"=>116519892, "AD"=>54808708}},
      {:date=> Date.parse('2033-01-01'), :accounts=>{"AA"=>119761857, "AD"=>58327096}},
      {:date=> Date.parse('2034-01-01'), :accounts=>{"AA"=>120496593, "AD"=>61504379}},
      {:date=> Date.parse('2035-01-01'), :accounts=>{"AA"=>119856223, "AD"=>64579598}},
      {:date=> Date.parse('2036-01-01'), :accounts=>{"AA"=>119050530, "AD"=>67808578}},
      {:date=> Date.parse('2037-01-01'), :accounts=>{"AA"=>118085134, "AD"=>71208525}},
      {:date=> Date.parse('2038-01-01'), :accounts=>{"AA"=>116916223, "AD"=>74768951}},
      {:date=> Date.parse('2039-01-01'), :accounts=>{"AA"=>115547400, "AD"=>78507399}},
      {:date=> Date.parse('2040-01-01'), :accounts=>{"AA"=>113965835, "AD"=>82432769}},
      {:date=> Date.parse('2041-01-01'), :accounts=>{"AA"=>112173859, "AD"=>86565978}},
      {:date=> Date.parse('2042-01-01'), :accounts=>{"AA"=>110126328, "AD"=>90894277}},
      {:date=> Date.parse('2043-01-01'), :accounts=>{"AA"=>107823295, "AD"=>95438991}},
      {:date=> Date.parse('2044-01-01'), :accounts=>{"AA"=>105248919, "AD"=>100210941}},
      {:date=> Date.parse('2045-01-01'), :accounts=>{"AA"=>102401101, "AD"=>105235554}},
      {:date=> Date.parse('2046-01-01'), :accounts=>{"AA"=>99233814, "AD"=>110497332}},
      {:date=> Date.parse('2047-01-01'), :accounts=>{"AA"=>95742417, "AD"=>116022199}},
      {:date=> Date.parse('2048-01-01'), :accounts=>{"AA"=>91907393, "AD"=>121823309}},
      {:date=> Date.parse('2049-01-01'), :accounts=>{"AA"=>87720870, "AD"=>127931574}},
      {:date=> Date.parse('2050-01-01'), :accounts=>{"AA"=>83136421, "AD"=>134328153}},
      {:date=> Date.parse('2051-01-01'), :accounts=>{"AA"=>78143338, "AD"=>141044561}},
      {:date=> Date.parse('2052-01-01'), :accounts=>{"AA"=>72717618, "AD"=>148096789}},
      {:date=> Date.parse('2053-01-01'), :accounts=>{"AA"=>66843932, "AD"=>155522416}},
      {:date=> Date.parse('2054-01-01'), :accounts=>{"AA"=>60476190, "AD"=>163298537}},
      {:date=> Date.parse('2055-01-01'), :accounts=>{"AA"=>53595863, "AD"=>171463464}},
      {:date=> Date.parse('2056-01-01'), :accounts=>{"AA"=>46173426, "AD"=>180036637}},
      {:date=> Date.parse('2057-01-01'), :accounts=>{"AA"=>38184076, "AD"=>189063740}},
      {:date=> Date.parse('2058-01-01'), :accounts=>{"AA"=>29582930, "AD"=>198516927}},
      {:date=> Date.parse('2059-01-01'), :accounts=>{"AA"=>20341520, "AD"=>208442773}},
      {:date=> Date.parse('2060-01-01'), :accounts=>{"AA"=>10423628, "AD"=>218864912}},
      {:date=> Date.parse('2061-01-01'), :accounts=>{"AA"=>0, "AD"=>229631229}},
      {:date=> Date.parse('2062-01-01'), :accounts=>{"AA"=>0, "AD"=>229736049}},
      {:date=> Date.parse('2063-01-01'), :accounts=>{"AA"=>0, "AD"=>229618561}},
      {:date=> Date.parse('2064-01-01'), :accounts=>{"AA"=>0, "AD"=>229263126}},
      {:date=> Date.parse('2065-01-01'), :accounts=>{"AA"=>0, "AD"=>228685097}}
    ]
  end

  def expected_with_reallocation
    [
      {:date => Date.parse("2017-12-14"), :accounts => {"AA" => 50000000, "AD" => 20000000}},
      {:date => Date.parse("2018-01-01"), :accounts => {"AA" => 50120450, "AD" => 20048180}},
      {:date => Date.parse("2019-01-01"), :accounts => {"AA" => 53653462, "AD" => 21820831}},
      {:date => Date.parse("2020-01-01"), :accounts => {"AA" => 57363122, "AD" => 23682114}},
      {:date => Date.parse("2021-01-01"), :accounts => {"AA" => 61266340, "AD" => 25639805}},
      {:date => Date.parse("2022-01-01"), :accounts => {"AA" => 65356645, "AD" => 27692038}},
      {:date => Date.parse("2023-01-01"), :accounts => {"AA" => 69651463, "AD" => 29846880}},
      {:date => Date.parse("2024-01-01"), :accounts => {"AA" => 74161023, "AD" => 32109468}},
      {:date => Date.parse("2025-01-01"), :accounts => {"AA" => 78906495, "AD" => 34489710}},
      {:date => Date.parse("2026-01-01"), :accounts => {"AA" => 83878806, "AD" => 36984437}},
      {:date => Date.parse("2027-01-01"), :accounts => {"AA" => 89099734, "AD" => 39603902}},
      {:date => Date.parse("2028-01-01"), :accounts => {"AA" => 94581706, "AD" => 42354341}},
      {:date => Date.parse("2029-01-01"), :accounts => {"AA" => 100351076, "AD" => 45248264}},
      {:date => Date.parse("2030-01-01"), :accounts => {"AA" => 106395619, "AD" => 48280918}},
      {:date => Date.parse("2031-01-01"), :accounts => {"AA" => 112742388, "AD" => 51465205}},
      {:date => Date.parse("2032-01-01"), :accounts => {"AA" => 116519916, "AD" => 54808707}},
      {:date => Date.parse("2033-01-01"), :accounts => {"AA" => 119761880, "AD" => 58327097}},
      {:date => Date.parse("2034-01-01"), :accounts => {"AA" => 120496615, "AD" => 61504381}},
      {:date => Date.parse("2035-01-01"), :accounts => {"AA" => 119856249, "AD" => 64579602}},
      {:date => Date.parse("2036-01-01"), :accounts => {"AA" => 119050558, "AD" => 67808582}},
      {:date => Date.parse("2037-01-01"), :accounts => {"AA" => 118085164, "AD" => 71208530}},
      {:date => Date.parse("2038-01-01"), :accounts => {"AA" => 116916255, "AD" => 74768956}},
      {:date => Date.parse("2039-01-01"), :accounts => {"AA" => 115547437, "AD" => 78507404}},
      {:date => Date.parse("2040-01-01"), :accounts => {"AA" => 113965877, "AD" => 82432774}},
      {:date => Date.parse("2041-01-01"), :accounts => {"AA" => 112173903, "AD" => 86565984}},
      {:date => Date.parse("2042-01-01"), :accounts => {"AA" => 110126373, "AD" => 90894284}},
      {:date => Date.parse("2043-01-01"), :accounts => {"AA" => 107823343, "AD" => 95438998}},
      {:date => Date.parse("2044-01-01"), :accounts => {"AA" => 105248970, "AD" => 100210948}},
      {:date => Date.parse("2045-01-01"), :accounts => {"AA" => 102401155, "AD" => 105235562}},
      {:date => Date.parse("2046-01-01"), :accounts => {"AA" => 99233871, "AD" => 110497340}},
      {:date => Date.parse("2047-01-01"), :accounts => {"AA" => 95742478, "AD" => 116022208}},
      {:date => Date.parse("2048-01-01"), :accounts => {"AA" => 91907456, "AD" => 121823318}},
      {:date => Date.parse("2049-01-01"), :accounts => {"AA" => 87720937, "AD" => 127931584}},
      {:date => Date.parse("2050-01-01"), :accounts => {"AA" => 83136491, "AD" => 134328164}},
      {:date => Date.parse("2051-01-01"), :accounts => {"AA" => 78143415, "AD" => 141044572}},
      {:date => Date.parse("2052-01-01"), :accounts => {"AA" => 72717699, "AD" => 148096800}},
      {:date => Date.parse("2053-01-01"), :accounts => {"AA" => 66844017, "AD" => 155522428}},
      {:date => Date.parse("2054-01-01"), :accounts => {"AA" => 60476284, "AD" => 163298550}},
      {:date => Date.parse("2055-01-01"), :accounts => {"AA" => 53595960, "AD" => 171463478}},
      {:date => Date.parse("2056-01-01"), :accounts => {"AA" => 46173527, "AD" => 180036652}},
      {:date => Date.parse("2057-01-01"), :accounts => {"AA" => 38184183, "AD" => 189063756}},
      {:date => Date.parse("2058-01-01"), :accounts => {"AA" => 29583045, "AD" => 198516944}},
      {:date => Date.parse("2059-01-01"), :accounts => {"AA" => 20341640, "AD" => 208442792}},
      {:date => Date.parse("2060-01-01"), :accounts => {"AA" => 10423753, "AD" => 218864932}},
      {:date => Date.parse("2061-01-01"), :accounts => {"AA" => 0, "AD" => 229631383}},
      {:date => Date.parse("2062-01-01"), :accounts => {"AA" => 0, "AD" => 229736208}},
      {:date => Date.parse("2063-01-01"), :accounts => {"AA" => 0, "AD" => 229618729}},
      {:date => Date.parse("2064-01-01"), :accounts => {"AA" => 0, "AD" => 229263303}},
      {:date => Date.parse("2065-01-01"), :accounts => {"AA" => 0, "AD" => 228685284}}
    ]
  end

  def test_expected_results
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      FortuneTeller::Benchmark.run.as_json
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
      sim.simulate(**context).as_json
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
      sim.simulate(**context).as_json
    end

    puts result.to_json
    
    result.zip(expected_with_reallocation) do |actual, expected|
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
