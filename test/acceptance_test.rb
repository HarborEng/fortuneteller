require 'test_helper'
require 'date'

class AcceptanceTest < Minitest::Test
  def test_expected_results
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      FortuneTeller::Benchmark.run.as_json
    end

    expected = [
      {:date=> Date.parse('2017-12-14'), :accounts=>{"AA"=>50000000, "AD"=>20000000}},
      {:date=> Date.parse('2018-01-01'), :accounts=>{"AA"=>50120449, "AD"=>20048179}},
      {:date=> Date.parse('2019-01-01'), :accounts=>{"AA"=>53653440, "AD"=>21820824}},
      {:date=> Date.parse('2020-01-01'), :accounts=>{"AA"=>57363080, "AD"=>23682102}},
      {:date=> Date.parse('2021-01-01'), :accounts=>{"AA"=>61266277, "AD"=>25639783}},
      {:date=> Date.parse('2022-01-01'), :accounts=>{"AA"=>65356559, "AD"=>27692008}},
      {:date=> Date.parse('2023-01-01'), :accounts=>{"AA"=>69651353, "AD"=>29846845}},
      {:date=> Date.parse('2024-01-01'), :accounts=>{"AA"=>74160886, "AD"=>32109424}},
      {:date=> Date.parse('2025-01-01'), :accounts=>{"AA"=>78906331, "AD"=>34489657}},
      {:date=> Date.parse('2026-01-01'), :accounts=>{"AA"=>83878615, "AD"=>36984377}},
      {:date=> Date.parse('2027-01-01'), :accounts=>{"AA"=>89099513, "AD"=>39603832}},
      {:date=> Date.parse('2028-01-01'), :accounts=>{"AA"=>94581457, "AD"=>42354259}},
      {:date=> Date.parse('2029-01-01'), :accounts=>{"AA"=>100350795, "AD"=>45248171}},
      {:date=> Date.parse('2030-01-01'), :accounts=>{"AA"=>106395303, "AD"=>48280815}},
      {:date=> Date.parse('2031-01-01'), :accounts=>{"AA"=>112742035, "AD"=>51465090}},
      {:date=> Date.parse('2032-01-01'), :accounts=>{"AA"=>116519536, "AD"=>54808582}},
      {:date=> Date.parse('2033-01-01'), :accounts=>{"AA"=>119761462, "AD"=>58326958}},
      {:date=> Date.parse('2034-01-01'), :accounts=>{"AA"=>120496173, "AD"=>61504232}},
      {:date=> Date.parse('2035-01-01'), :accounts=>{"AA"=>119855763, "AD"=>64579443}},
      {:date=> Date.parse('2036-01-01'), :accounts=>{"AA"=>119050027, "AD"=>67808415}},
      {:date=> Date.parse('2037-01-01'), :accounts=>{"AA"=>118084587, "AD"=>71208353}},
      {:date=> Date.parse('2038-01-01'), :accounts=>{"AA"=>116915630, "AD"=>74768770}},
      {:date=> Date.parse('2039-01-01'), :accounts=>{"AA"=>115546771, "AD"=>78507208}},
      {:date=> Date.parse('2040-01-01'), :accounts=>{"AA"=>113965182, "AD"=>82432568}},
      {:date=> Date.parse('2041-01-01'), :accounts=>{"AA"=>112173155, "AD"=>86565767}},
      {:date=> Date.parse('2042-01-01'), :accounts=>{"AA"=>110125571, "AD"=>90894055}},
      {:date=> Date.parse('2043-01-01'), :accounts=>{"AA"=>107822483, "AD"=>95438757}},
      {:date=> Date.parse('2044-01-01'), :accounts=>{"AA"=>105248061, "AD"=>100210694}},
      {:date=> Date.parse('2045-01-01'), :accounts=>{"AA"=>102400195, "AD"=>105235294}},
      {:date=> Date.parse('2046-01-01'), :accounts=>{"AA"=>99232856, "AD"=>110497058}},
      {:date=> Date.parse('2047-01-01'), :accounts=>{"AA"=>95741396, "AD"=>116021910}},
      {:date=> Date.parse('2048-01-01'), :accounts=>{"AA"=>91906290, "AD"=>121823005}},
      {:date=> Date.parse('2049-01-01'), :accounts=>{"AA"=>87719693, "AD"=>127931254}},
      {:date=> Date.parse('2050-01-01'), :accounts=>{"AA"=>83135180, "AD"=>134327816}},
      {:date=> Date.parse('2051-01-01'), :accounts=>{"AA"=>78142042, "AD"=>141044206}},
      {:date=> Date.parse('2052-01-01'), :accounts=>{"AA"=>72716239, "AD"=>148096416}},
      {:date=> Date.parse('2053-01-01'), :accounts=>{"AA"=>66842476, "AD"=>155522024}},
      {:date=> Date.parse('2054-01-01'), :accounts=>{"AA"=>60474645, "AD"=>163298125}},
      {:date=> Date.parse('2055-01-01'), :accounts=>{"AA"=>53594222, "AD"=>171463031}},
      {:date=> Date.parse('2056-01-01'), :accounts=>{"AA"=>46171695, "AD"=>180036182}},
      {:date=> Date.parse('2057-01-01'), :accounts=>{"AA"=>38182239, "AD"=>189063261}},
      {:date=> Date.parse('2058-01-01'), :accounts=>{"AA"=>29580971, "AD"=>198516424}},
      {:date=> Date.parse('2059-01-01'), :accounts=>{"AA"=>20339445, "AD"=>208442245}},
      {:date=> Date.parse('2060-01-01'), :accounts=>{"AA"=>10421418, "AD"=>218864357}},
      {:date=> Date.parse('2061-01-01'), :accounts=>{"AA"=>0, "AD"=>229628308}},
      {:date=> Date.parse('2062-01-01'), :accounts=>{"AA"=>0, "AD"=>229732962}},
      {:date=> Date.parse('2063-01-01'), :accounts=>{"AA"=>0, "AD"=>229615314}},
      {:date=> Date.parse('2064-01-01'), :accounts=>{"AA"=>0, "AD"=>229259699}},
      {:date=> Date.parse('2065-01-01'), :accounts=>{"AA"=>0, "AD"=>228681479}}
    ]

    result.zip(expected) do |actual, expected|
      assert_equal actual, expected
    end
  end
end
