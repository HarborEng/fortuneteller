require 'test_helper'
require 'date'

class AcceptanceTest < Minitest::Test
  def test_expected_results
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      FortuneTeller::Benchmark.run.as_json
    end

    expected = [
      {:date=> Date.parse('2017-12-14'), :accounts=>{"AA"=>50000000, "AD"=>20000000}},
      {:date=> Date.parse('2018-01-01'), :accounts=>{"AA"=>50120450, "AD"=>20048180}},
      {:date=> Date.parse('2019-01-01'), :accounts=>{"AA"=>53653445, "AD"=>21820831}},
      {:date=> Date.parse('2020-01-01'), :accounts=>{"AA"=>57363093, "AD"=>23682114}},
      {:date=> Date.parse('2021-01-01'), :accounts=>{"AA"=>61266296, "AD"=>25639805}},
      {:date=> Date.parse('2022-01-01'), :accounts=>{"AA"=>65356587, "AD"=>27692038}},
      {:date=> Date.parse('2023-01-01'), :accounts=>{"AA"=>69651389, "AD"=>29846882}},
      {:date=> Date.parse('2024-01-01'), :accounts=>{"AA"=>74160935, "AD"=>32109468}},
      {:date=> Date.parse('2025-01-01'), :accounts=>{"AA"=>78906389, "AD"=>34489709}},
      {:date=> Date.parse('2026-01-01'), :accounts=>{"AA"=>83878681, "AD"=>36984438}},
      {:date=> Date.parse('2027-01-01'), :accounts=>{"AA"=>89099590, "AD"=>39603901}},
      {:date=> Date.parse('2028-01-01'), :accounts=>{"AA"=>94581543, "AD"=>42354339}},
      {:date=> Date.parse('2029-01-01'), :accounts=>{"AA"=>100350894, "AD"=>45248262}},
      {:date=> Date.parse('2030-01-01'), :accounts=>{"AA"=>106395413, "AD"=>48280917}},
      {:date=> Date.parse('2031-01-01'), :accounts=>{"AA"=>112742156, "AD"=>51465204}},
      {:date=> Date.parse('2032-01-01'), :accounts=>{"AA"=>116519666, "AD"=>54808708}},
      {:date=> Date.parse('2033-01-01'), :accounts=>{"AA"=>119761608, "AD"=>58327096}},
      {:date=> Date.parse('2034-01-01'), :accounts=>{"AA"=>120496332, "AD"=>61504379}},
      {:date=> Date.parse('2035-01-01'), :accounts=>{"AA"=>119855938, "AD"=>64579598}},
      {:date=> Date.parse('2036-01-01'), :accounts=>{"AA"=>119050213, "AD"=>67808578}},
      {:date=> Date.parse('2037-01-01'), :accounts=>{"AA"=>118084788, "AD"=>71208525}},
      {:date=> Date.parse('2038-01-01'), :accounts=>{"AA"=>116915849, "AD"=>74768951}},
      {:date=> Date.parse('2039-01-01'), :accounts=>{"AA"=>115547008, "AD"=>78507399}},
      {:date=> Date.parse('2040-01-01'), :accounts=>{"AA"=>113965435, "AD"=>82432769}},
      {:date=> Date.parse('2041-01-01'), :accounts=>{"AA"=>112173425, "AD"=>86565978}},
      {:date=> Date.parse('2042-01-01'), :accounts=>{"AA"=>110125859, "AD"=>90894277}},
      {:date=> Date.parse('2043-01-01'), :accounts=>{"AA"=>107822790, "AD"=>95438991}},
      {:date=> Date.parse('2044-01-01'), :accounts=>{"AA"=>105248389, "AD"=>100210941}},
      {:date=> Date.parse('2045-01-01'), :accounts=>{"AA"=>102400546, "AD"=>105235554}},
      {:date=> Date.parse('2046-01-01'), :accounts=>{"AA"=>99233230, "AD"=>110497332}},
      {:date=> Date.parse('2047-01-01'), :accounts=>{"AA"=>95741794, "AD"=>116022199}},
      {:date=> Date.parse('2048-01-01'), :accounts=>{"AA"=>91906714, "AD"=>121823309}},
      {:date=> Date.parse('2049-01-01'), :accounts=>{"AA"=>87720145, "AD"=>127931574}},
      {:date=> Date.parse('2050-01-01'), :accounts=>{"AA"=>83135660, "AD"=>134328153}},
      {:date=> Date.parse('2051-01-01'), :accounts=>{"AA"=>78142553, "AD"=>141044561}},
      {:date=> Date.parse('2052-01-01'), :accounts=>{"AA"=>72716780, "AD"=>148096789}},
      {:date=> Date.parse('2053-01-01'), :accounts=>{"AA"=>66843051, "AD"=>155522416}},
      {:date=> Date.parse('2054-01-01'), :accounts=>{"AA"=>60475255, "AD"=>163298537}},
      {:date=> Date.parse('2055-01-01'), :accounts=>{"AA"=>53594869, "AD"=>171463464}},
      {:date=> Date.parse('2056-01-01'), :accounts=>{"AA"=>46172382, "AD"=>180036637}},
      {:date=> Date.parse('2057-01-01'), :accounts=>{"AA"=>38182968, "AD"=>189063740}},
      {:date=> Date.parse('2058-01-01'), :accounts=>{"AA"=>29581743, "AD"=>198516927}},
      {:date=> Date.parse('2059-01-01'), :accounts=>{"AA"=>20340260, "AD"=>208442773}},
      {:date=> Date.parse('2060-01-01'), :accounts=>{"AA"=>10422281, "AD"=>218864912}},
      {:date=> Date.parse('2061-01-01'), :accounts=>{"AA"=>0, "AD"=>229629804}},
      {:date=> Date.parse('2062-01-01'), :accounts=>{"AA"=>0, "AD"=>229734539}},
      {:date=> Date.parse('2063-01-01'), :accounts=>{"AA"=>0, "AD"=>229616975}},
      {:date=> Date.parse('2064-01-01'), :accounts=>{"AA"=>0, "AD"=>229261451}},
      {:date=> Date.parse('2065-01-01'), :accounts=>{"AA"=>0, "AD"=>228683326}}
    ]

    result.zip(expected) do |actual, expected|
      assert_equal actual, expected
    end
  end
end
