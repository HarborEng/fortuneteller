require 'test_helper'

class AcceptanceTest < Minitest::Test

  def expected_no_reallocation
    [
      {"date"=>"2017-12-14", "accounts"=>{"AA"=>{"date"=>"2017-12-14", "type"=>"_401k", "balances"=>{"stocks"=>30000000, "bonds"=>20000000}}, "AD"=>{"date"=>"2017-12-14", "type"=>"_401k", "balances"=>{"stocks"=>20000000}}}, "cashflow"=>{"w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>0, "posttax"=>0}}, 
      {"date"=>"2018-01-01", "accounts"=>{"AA"=>{"date"=>"2018-01-01", "type"=>"_401k", "balances"=>{"stocks"=>30086330, "bonds"=>20038721}}, "AD"=>{"date"=>"2018-01-01", "type"=>"_401k", "balances"=>{"stocks"=>20057553}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2019-01-01", "accounts"=>{"AA"=>{"date"=>"2019-01-01", "type"=>"_401k", "balances"=>{"stocks"=>32923847, "bonds"=>20840269}}, "AD"=>{"date"=>"2019-01-01", "type"=>"_401k", "balances"=>{"stocks"=>22035261}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2020-01-01", "accounts"=>{"AA"=>{"date"=>"2020-01-01", "type"=>"_401k", "balances"=>{"stocks"=>35931615, "bonds"=>21673878}}, "AD"=>{"date"=>"2020-01-01", "type"=>"_401k", "balances"=>{"stocks"=>24131633}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2021-01-01", "accounts"=>{"AA"=>{"date"=>"2021-01-01", "type"=>"_401k", "balances"=>{"stocks"=>39125958, "bonds"=>22543255}}, "AD"=>{"date"=>"2021-01-01", "type"=>"_401k", "balances"=>{"stocks"=>26357891}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2022-01-01", "accounts"=>{"AA"=>{"date"=>"2022-01-01", "type"=>"_401k", "balances"=>{"stocks"=>42505851, "bonds"=>23444986}}, "AD"=>{"date"=>"2022-01-01", "type"=>"_401k", "balances"=>{"stocks"=>28713621}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2023-01-01", "accounts"=>{"AA"=>{"date"=>"2023-01-01", "type"=>"_401k", "balances"=>{"stocks"=>46088541, "bonds"=>24382785}}, "AD"=>{"date"=>"2023-01-01", "type"=>"_401k", "balances"=>{"stocks"=>31210694}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2024-01-01", "accounts"=>{"AA"=>{"date"=>"2024-01-01", "type"=>"_401k", "balances"=>{"stocks"=>49886191, "bonds"=>25358095}}, "AD"=>{"date"=>"2024-01-01", "type"=>"_401k", "balances"=>{"stocks"=>33857592}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2025-01-01", "accounts"=>{"AA"=>{"date"=>"2025-01-01", "type"=>"_401k", "balances"=>{"stocks"=>53920171, "bonds"=>26375254}}, "AD"=>{"date"=>"2025-01-01", "type"=>"_401k", "balances"=>{"stocks"=>36669054}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2026-01-01", "accounts"=>{"AA"=>{"date"=>"2026-01-01", "type"=>"_401k", "balances"=>{"stocks"=>58187720, "bonds"=>27430264}}, "AD"=>{"date"=>"2026-01-01", "type"=>"_401k", "balances"=>{"stocks"=>39643454}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2027-01-01", "accounts"=>{"AA"=>{"date"=>"2027-01-01", "type"=>"_401k", "balances"=>{"stocks"=>62711320, "bonds"=>28527474}}, "AD"=>{"date"=>"2027-01-01", "type"=>"_401k", "balances"=>{"stocks"=>42796318}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2028-01-01", "accounts"=>{"AA"=>{"date"=>"2028-01-01", "type"=>"_401k", "balances"=>{"stocks"=>67506337, "bonds"=>29668574}}, "AD"=>{"date"=>"2028-01-01", "type"=>"_401k", "balances"=>{"stocks"=>46138353}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2029-01-01", "accounts"=>{"AA"=>{"date"=>"2029-01-01", "type"=>"_401k", "balances"=>{"stocks"=>72600506, "bonds"=>30858632}}, "AD"=>{"date"=>"2029-01-01", "type"=>"_401k", "balances"=>{"stocks"=>49688739}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2030-01-01", "accounts"=>{"AA"=>{"date"=>"2030-01-01", "type"=>"_401k", "balances"=>{"stocks"=>77988874, "bonds"=>32092978}}, "AD"=>{"date"=>"2030-01-01", "type"=>"_401k", "balances"=>{"stocks"=>53444320}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2031-01-01", "accounts"=>{"AA"=>{"date"=>"2031-01-01", "type"=>"_401k", "balances"=>{"stocks"=>83700544, "bonds"=>33376696}}, "AD"=>{"date"=>"2031-01-01", "type"=>"_401k", "balances"=>{"stocks"=>57425236}}}, "cashflow"=>{"pretax_w2"=>8525000, "pretax_ss"=>3963850, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>5967500, "posttax_ss"=>3963850, "posttax"=>11920190, "withdrawal"=>1988840}}, 
      {"date"=>"2032-01-01", "accounts"=>{"AA"=>{"date"=>"2032-01-01", "type"=>"_401k", "balances"=>{"stocks"=>87918275, "bonds"=>34328903}}, "AD"=>{"date"=>"2032-01-01", "type"=>"_401k", "balances"=>{"stocks"=>60968607}}}, "cashflow"=>{"pretax_w2"=>6975000, "pretax_ss"=>4851756, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>4882500, "posttax_ss"=>4851756, "posttax"=>12266244, "withdrawal"=>2531988}}, 
      {"date"=>"2033-01-01", "accounts"=>{"AA"=>{"date"=>"2033-01-01", "type"=>"_401k", "balances"=>{"stocks"=>91954481, "bonds"=>35225603}}, "AD"=>{"date"=>"2033-01-01", "type"=>"_401k", "balances"=>{"stocks"=>64536488}}}, "cashflow"=>{"pretax_w2"=>2325000, "pretax_ss"=>5748788, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>1627500, "posttax_ss"=>5748788, "posttax"=>12511572, "withdrawal"=>5135284}}, 
      {"date"=>"2034-01-01", "accounts"=>{"AA"=>{"date"=>"2034-01-01", "type"=>"_401k", "balances"=>{"stocks"=>94939219, "bonds"=>35682779}}, "AD"=>{"date"=>"2034-01-01", "type"=>"_401k", "balances"=>{"stocks"=>66887987}}}, "cashflow"=>{"pretax_ss"=>6271764, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6271764, "posttax"=>12761796, "withdrawal"=>6490032}}, 
      {"date"=>"2035-01-01", "accounts"=>{"AA"=>{"date"=>"2035-01-01", "type"=>"_401k", "balances"=>{"stocks"=>97410063, "bonds"=>35920661}}, "AD"=>{"date"=>"2035-01-01", "type"=>"_401k", "balances"=>{"stocks"=>68628784}}}, "cashflow"=>{"pretax_ss"=>6397200, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6397200, "posttax"=>13017036, "withdrawal"=>6619836}}, 
      {"date"=>"2036-01-01", "accounts"=>{"AA"=>{"date"=>"2036-01-01", "type"=>"_401k", "balances"=>{"stocks"=>99953473, "bonds"=>36163121}}, "AD"=>{"date"=>"2036-01-01", "type"=>"_401k", "balances"=>{"stocks"=>70420704}}}, "cashflow"=>{"pretax_ss"=>6525144, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6525144, "posttax"=>13277376, "withdrawal"=>6752232}}, 
      {"date"=>"2037-01-01", "accounts"=>{"AA"=>{"date"=>"2037-01-01", "type"=>"_401k", "balances"=>{"stocks"=>102589006, "bonds"=>36414439}}, "AD"=>{"date"=>"2037-01-01", "type"=>"_401k", "balances"=>{"stocks"=>72277525}}}, "cashflow"=>{"pretax_ss"=>6655644, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6655644, "posttax"=>13542924, "withdrawal"=>6887280}}, 
      {"date"=>"2038-01-01", "accounts"=>{"AA"=>{"date"=>"2038-01-01", "type"=>"_401k", "balances"=>{"stocks"=>105286928, "bonds"=>36666944}}, "AD"=>{"date"=>"2038-01-01", "type"=>"_401k", "balances"=>{"stocks"=>74178306}}}, "cashflow"=>{"pretax_ss"=>6788760, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6788760, "posttax"=>13813788, "withdrawal"=>7025028}}, 
      {"date"=>"2039-01-01", "accounts"=>{"AA"=>{"date"=>"2039-01-01", "type"=>"_401k", "balances"=>{"stocks"=>108066152, "bonds"=>36924737}}, "AD"=>{"date"=>"2039-01-01", "type"=>"_401k", "balances"=>{"stocks"=>76136367}}}, "cashflow"=>{"pretax_ss"=>6924528, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6924528, "posttax"=>14090064, "withdrawal"=>7165536}}, 
      {"date"=>"2040-01-01", "accounts"=>{"AA"=>{"date"=>"2040-01-01", "type"=>"_401k", "balances"=>{"stocks"=>110929862, "bonds"=>37188070}}, "AD"=>{"date"=>"2040-01-01", "type"=>"_401k", "balances"=>{"stocks"=>78153948}}}, "cashflow"=>{"pretax_ss"=>7063032, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7063032, "posttax"=>14371860, "withdrawal"=>7308828}}, 
      {"date"=>"2041-01-01", "accounts"=>{"AA"=>{"date"=>"2041-01-01", "type"=>"_401k", "balances"=>{"stocks"=>113900055, "bonds"=>37461391}}, "AD"=>{"date"=>"2041-01-01", "type"=>"_401k", "balances"=>{"stocks"=>80246554}}}, "cashflow"=>{"pretax_ss"=>7204284, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7204284, "posttax"=>14659296, "withdrawal"=>7455012}}, 
      {"date"=>"2042-01-01", "accounts"=>{"AA"=>{"date"=>"2042-01-01", "type"=>"_401k", "balances"=>{"stocks"=>116944024, "bonds"=>37736835}}, "AD"=>{"date"=>"2042-01-01", "type"=>"_401k", "balances"=>{"stocks"=>82391136}}}, "cashflow"=>{"pretax_ss"=>7348368, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7348368, "posttax"=>14952480, "withdrawal"=>7604112}}, 
      {"date"=>"2043-01-01", "accounts"=>{"AA"=>{"date"=>"2043-01-01", "type"=>"_401k", "balances"=>{"stocks"=>120083083, "bonds"=>38018655}}, "AD"=>{"date"=>"2043-01-01", "type"=>"_401k", "balances"=>{"stocks"=>84602713}}}, "cashflow"=>{"pretax_ss"=>7495332, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7495332, "posttax"=>15251532, "withdrawal"=>7756200}}, 
      {"date"=>"2044-01-01", "accounts"=>{"AA"=>{"date"=>"2044-01-01", "type"=>"_401k", "balances"=>{"stocks"=>123321104, "bonds"=>38307143}}, "AD"=>{"date"=>"2044-01-01", "type"=>"_401k", "balances"=>{"stocks"=>86884011}}}, "cashflow"=>{"pretax_ss"=>7645236, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7645236, "posttax"=>15556560, "withdrawal"=>7911324}}, 
      {"date"=>"2045-01-01", "accounts"=>{"AA"=>{"date"=>"2045-01-01", "type"=>"_401k", "balances"=>{"stocks"=>126682893, "bonds"=>38606919}}, "AD"=>{"date"=>"2045-01-01", "type"=>"_401k", "balances"=>{"stocks"=>89252505}}}, "cashflow"=>{"pretax_ss"=>7798152, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7798152, "posttax"=>15867696, "withdrawal"=>8069544}}, 
      {"date"=>"2046-01-01", "accounts"=>{"AA"=>{"date"=>"2046-01-01", "type"=>"_401k", "balances"=>{"stocks"=>130132476, "bonds"=>38909920}}, "AD"=>{"date"=>"2046-01-01", "type"=>"_401k", "balances"=>{"stocks"=>91682853}}}, "cashflow"=>{"pretax_ss"=>7954116, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7954116, "posttax"=>16185048, "withdrawal"=>8230932}}, 
      {"date"=>"2047-01-01", "accounts"=>{"AA"=>{"date"=>"2047-01-01", "type"=>"_401k", "balances"=>{"stocks"=>133693941, "bonds"=>39220562}}, "AD"=>{"date"=>"2047-01-01", "type"=>"_401k", "balances"=>{"stocks"=>94192033}}}, "cashflow"=>{"pretax_ss"=>8113200, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8113200, "posttax"=>16508748, "withdrawal"=>8395548}}, 
      {"date"=>"2048-01-01", "accounts"=>{"AA"=>{"date"=>"2048-01-01", "type"=>"_401k", "balances"=>{"stocks"=>137372026, "bonds"=>39539200}}, "AD"=>{"date"=>"2048-01-01", "type"=>"_401k", "balances"=>{"stocks"=>96783371}}}, "cashflow"=>{"pretax_ss"=>8275464, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8275464, "posttax"=>16838928, "withdrawal"=>8563464}}, 
      {"date"=>"2049-01-01", "accounts"=>{"AA"=>{"date"=>"2049-01-01", "type"=>"_401k", "balances"=>{"stocks"=>141194804, "bonds"=>39870630}}, "AD"=>{"date"=>"2049-01-01", "type"=>"_401k", "balances"=>{"stocks"=>99476647}}}, "cashflow"=>{"pretax_ss"=>8440968, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8440968, "posttax"=>17175708, "withdrawal"=>8734740}}, 
      {"date"=>"2050-01-01", "accounts"=>{"AA"=>{"date"=>"2050-01-01", "type"=>"_401k", "balances"=>{"stocks"=>145122663, "bonds"=>40206578}}, "AD"=>{"date"=>"2050-01-01", "type"=>"_401k", "balances"=>{"stocks"=>102243960}}}, "cashflow"=>{"pretax_ss"=>8609784, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8609784, "posttax"=>17519220, "withdrawal"=>8909436}}, 
      {"date"=>"2051-01-01", "accounts"=>{"AA"=>{"date"=>"2051-01-01", "type"=>"_401k", "balances"=>{"stocks"=>149182944, "bonds"=>40551652}}, "AD"=>{"date"=>"2051-01-01", "type"=>"_401k", "balances"=>{"stocks"=>105104573}}}, "cashflow"=>{"pretax_ss"=>8781984, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8781984, "posttax"=>17869596, "withdrawal"=>9087612}}, 
      {"date"=>"2052-01-01", "accounts"=>{"AA"=>{"date"=>"2052-01-01", "type"=>"_401k", "balances"=>{"stocks"=>153381465, "bonds"=>40906253}}, "AD"=>{"date"=>"2052-01-01", "type"=>"_401k", "balances"=>{"stocks"=>108062577}}}, "cashflow"=>{"pretax_ss"=>8957616, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8957616, "posttax"=>18226992, "withdrawal"=>9269376}}, 
      {"date"=>"2053-01-01", "accounts"=>{"AA"=>{"date"=>"2053-01-01", "type"=>"_401k", "balances"=>{"stocks"=>157750121, "bonds"=>41275406}}, "AD"=>{"date"=>"2053-01-01", "type"=>"_401k", "balances"=>{"stocks"=>111140445}}}, "cashflow"=>{"pretax_ss"=>9136776, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9136776, "posttax"=>18591528, "withdrawal"=>9454752}}, 
      {"date"=>"2054-01-01", "accounts"=>{"AA"=>{"date"=>"2054-01-01", "type"=>"_401k", "balances"=>{"stocks"=>162245280, "bonds"=>41650591}}, "AD"=>{"date"=>"2054-01-01", "type"=>"_401k", "balances"=>{"stocks"=>114307439}}}, "cashflow"=>{"pretax_ss"=>9319512, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9319512, "posttax"=>18963360, "withdrawal"=>9643848}}, 
      {"date"=>"2055-01-01", "accounts"=>{"AA"=>{"date"=>"2055-01-01", "type"=>"_401k", "balances"=>{"stocks"=>166898083, "bonds"=>42036636}}, "AD"=>{"date"=>"2055-01-01", "type"=>"_401k", "balances"=>{"stocks"=>117585501}}}, "cashflow"=>{"pretax_ss"=>9505896, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9505896, "posttax"=>19342632, "withdrawal"=>9836736}}, 
      {"date"=>"2056-01-01", "accounts"=>{"AA"=>{"date"=>"2056-01-01", "type"=>"_401k", "balances"=>{"stocks"=>171715672, "bonds"=>42434005}}, "AD"=>{"date"=>"2056-01-01", "type"=>"_401k", "balances"=>{"stocks"=>120979661}}}, "cashflow"=>{"pretax_ss"=>9696024, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9696024, "posttax"=>19729488, "withdrawal"=>10033464}}, 
      {"date"=>"2057-01-01", "accounts"=>{"AA"=>{"date"=>"2057-01-01", "type"=>"_401k", "balances"=>{"stocks"=>176734472, "bonds"=>42847962}}, "AD"=>{"date"=>"2057-01-01", "type"=>"_401k", "balances"=>{"stocks"=>124515580}}}, "cashflow"=>{"pretax_ss"=>9889944, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9889944, "posttax"=>20124072, "withdrawal"=>10234128}}, 
      {"date"=>"2058-01-01", "accounts"=>{"AA"=>{"date"=>"2058-01-01", "type"=>"_401k", "balances"=>{"stocks"=>181906338, "bonds"=>43269733}}, "AD"=>{"date"=>"2058-01-01", "type"=>"_401k", "balances"=>{"stocks"=>128159341}}}, "cashflow"=>{"pretax_ss"=>10087740, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10087740, "posttax"=>20526552, "withdrawal"=>10438812}}, 
      {"date"=>"2059-01-01", "accounts"=>{"AA"=>{"date"=>"2059-01-01", "type"=>"_401k", "balances"=>{"stocks"=>187266924, "bonds"=>43704377}}, "AD"=>{"date"=>"2059-01-01", "type"=>"_401k", "balances"=>{"stocks"=>131936060}}}, "cashflow"=>{"pretax_ss"=>10289496, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10289496, "posttax"=>20937084, "withdrawal"=>10647588}}, 
      {"date"=>"2060-01-01", "accounts"=>{"AA"=>{"date"=>"2060-01-01", "type"=>"_401k", "balances"=>{"stocks"=>192825046, "bonds"=>44152446}}, "AD"=>{"date"=>"2060-01-01", "type"=>"_401k", "balances"=>{"stocks"=>135851951}}}, "cashflow"=>{"pretax_ss"=>10495284, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10495284, "posttax"=>21355824, "withdrawal"=>10860540}}, 
      {"date"=>"2061-01-01", "accounts"=>{"AA"=>{"date"=>"2061-01-01", "type"=>"_401k", "balances"=>{"stocks"=>198622450, "bonds"=>44619478}}, "AD"=>{"date"=>"2061-01-01", "type"=>"_401k", "balances"=>{"stocks"=>139936428}}}, "cashflow"=>{"pretax_ss"=>10705188, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10705188, "posttax"=>21782940, "withdrawal"=>11077752}}, 
      {"date"=>"2062-01-01", "accounts"=>{"AA"=>{"date"=>"2062-01-01", "type"=>"_401k", "balances"=>{"stocks"=>204605969, "bonds"=>45096408}}, "AD"=>{"date"=>"2062-01-01", "type"=>"_401k", "balances"=>{"stocks"=>144152027}}}, "cashflow"=>{"pretax_ss"=>10919280, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10919280, "posttax"=>22218600, "withdrawal"=>11299320}}, 
      {"date"=>"2063-01-01", "accounts"=>{"AA"=>{"date"=>"2063-01-01", "type"=>"_401k", "balances"=>{"stocks"=>210816594, "bonds"=>45588561}}, "AD"=>{"date"=>"2063-01-01", "type"=>"_401k", "balances"=>{"stocks"=>148527627}}}, "cashflow"=>{"pretax_ss"=>11137680, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>11137680, "posttax"=>22662972, "withdrawal"=>11525292}}, 
      {"date"=>"2064-01-01", "accounts"=>{"AA"=>{"date"=>"2064-01-01", "type"=>"_401k", "balances"=>{"stocks"=>217265254, "bonds"=>46096597}}, "AD"=>{"date"=>"2064-01-01", "type"=>"_401k", "balances"=>{"stocks"=>153070932}}}, "cashflow"=>{"pretax_ss"=>11360436, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>11360436, "posttax"=>23116236, "withdrawal"=>11755800}}, 
      {"date"=>"2065-01-01", "accounts"=>{"AA"=>{"date"=>"2065-01-01", "type"=>"_401k", "balances"=>{"stocks"=>224000032, "bonds"=>46626355}}, "AD"=>{"date"=>"2065-01-01", "type"=>"_401k", "balances"=>{"stocks"=>157815816}}}, "cashflow"=>nil}
    ]
  end

  def expected_5050_reallocation
    [
      {"date"=>"2017-12-14", "accounts"=>{"AA"=>{"date"=>"2017-12-14", "type"=>"_401k", "balances"=>{"stocks"=>30000000, "bonds"=>20000000}}, "AD"=>{"date"=>"2017-12-14", "type"=>"_401k", "balances"=>{"stocks"=>20000000}}}, "cashflow"=>{"w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>0, "posttax"=>0}}, 
      {"date"=>"2018-01-01", "accounts"=>{"AA"=>{"date"=>"2018-01-01", "type"=>"_401k", "balances"=>{"stocks"=>25071942, "bonds"=>25048401}}, "AD"=>{"date"=>"2018-01-01", "type"=>"_401k", "balances"=>{"stocks"=>10028777, "bonds"=>10019360}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2019-01-01", "accounts"=>{"AA"=>{"date"=>"2019-01-01", "type"=>"_401k", "balances"=>{"stocks"=>27596119, "bonds"=>26062578}}, "AD"=>{"date"=>"2019-01-01", "type"=>"_401k", "balances"=>{"stocks"=>11399770, "bonds"=>10425031}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2020-01-01", "accounts"=>{"AA"=>{"date"=>"2020-01-01", "type"=>"_401k", "balances"=>{"stocks"=>29471446, "bonds"=>27902524}}, "AD"=>{"date"=>"2020-01-01", "type"=>"_401k", "balances"=>{"stocks"=>12341401, "bonds"=>11348898}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2021-01-01", "accounts"=>{"AA"=>{"date"=>"2021-01-01", "type"=>"_401k", "balances"=>{"stocks"=>31445423, "bonds"=>29837670}}, "AD"=>{"date"=>"2021-01-01", "type"=>"_401k", "balances"=>{"stocks"=>13332140, "bonds"=>12320280}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2022-01-01", "accounts"=>{"AA"=>{"date"=>"2022-01-01", "type"=>"_401k", "balances"=>{"stocks"=>33512378, "bonds"=>31867206}}, "AD"=>{"date"=>"2022-01-01", "type"=>"_401k", "balances"=>{"stocks"=>14370039, "bonds"=>13339257}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2023-01-01", "accounts"=>{"AA"=>{"date"=>"2023-01-01", "type"=>"_401k", "balances"=>{"stocks"=>35683517, "bonds"=>33997383}}, "AD"=>{"date"=>"2023-01-01", "type"=>"_401k", "balances"=>{"stocks"=>15460182, "bonds"=>14408836}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2024-01-01", "accounts"=>{"AA"=>{"date"=>"2024-01-01", "type"=>"_401k", "balances"=>{"stocks"=>37963214, "bonds"=>36234069}}, "AD"=>{"date"=>"2024-01-01", "type"=>"_401k", "balances"=>{"stocks"=>16604835, "bonds"=>15531890}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2025-01-01", "accounts"=>{"AA"=>{"date"=>"2025-01-01", "type"=>"_401k", "balances"=>{"stocks"=>40363205, "bonds"=>38586732}}, "AD"=>{"date"=>"2025-01-01", "type"=>"_401k", "balances"=>{"stocks"=>17809462, "bonds"=>16712892}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2026-01-01", "accounts"=>{"AA"=>{"date"=>"2026-01-01", "type"=>"_401k", "balances"=>{"stocks"=>42875803, "bonds"=>41053968}}, "AD"=>{"date"=>"2026-01-01", "type"=>"_401k", "balances"=>{"stocks"=>19071104, "bonds"=>17951625}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2027-01-01", "accounts"=>{"AA"=>{"date"=>"2027-01-01", "type"=>"_401k", "balances"=>{"stocks"=>45515117, "bonds"=>43643482}}, "AD"=>{"date"=>"2027-01-01", "type"=>"_401k", "balances"=>{"stocks"=>20396303, "bonds"=>19251821}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2028-01-01", "accounts"=>{"AA"=>{"date"=>"2028-01-01", "type"=>"_401k", "balances"=>{"stocks"=>48286396, "bonds"=>46362473}}, "AD"=>{"date"=>"2028-01-01", "type"=>"_401k", "balances"=>{"stocks"=>21787762, "bonds"=>20617026}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2029-01-01", "accounts"=>{"AA"=>{"date"=>"2029-01-01", "type"=>"_401k", "balances"=>{"stocks"=>51204275, "bonds"=>49222702}}, "AD"=>{"date"=>"2029-01-01", "type"=>"_401k", "balances"=>{"stocks"=>23252403, "bonds"=>22052858}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2030-01-01", "accounts"=>{"AA"=>{"date"=>"2030-01-01", "type"=>"_401k", "balances"=>{"stocks"=>54258634, "bonds"=>52222028}}, "AD"=>{"date"=>"2030-01-01", "type"=>"_401k", "balances"=>{"stocks"=>24786045, "bonds"=>23558735}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2031-01-01", "accounts"=>{"AA"=>{"date"=>"2031-01-01", "type"=>"_401k", "balances"=>{"stocks"=>57467087, "bonds"=>55369945}}, "AD"=>{"date"=>"2031-01-01", "type"=>"_401k", "balances"=>{"stocks"=>26396989, "bonds"=>25139285}}}, "cashflow"=>{"pretax_w2"=>8525000, "pretax_ss"=>3963850, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>5967500, "posttax_ss"=>3963850, "posttax"=>11920190, "withdrawal"=>1988840}}, 
      {"date"=>"2032-01-01", "accounts"=>{"AA"=>{"date"=>"2032-01-01", "type"=>"_401k", "balances"=>{"stocks"=>59275472, "bonds"=>57986193}}, "AD"=>{"date"=>"2032-01-01", "type"=>"_401k", "balances"=>{"stocks"=>27762374, "bonds"=>26484145}}}, "cashflow"=>{"pretax_w2"=>6975000, "pretax_ss"=>4851756, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>4882500, "posttax_ss"=>4851756, "posttax"=>12266244, "withdrawal"=>2531988}}, 
      {"date"=>"2033-01-01", "accounts"=>{"AA"=>{"date"=>"2033-01-01", "type"=>"_401k", "balances"=>{"stocks"=>61263138, "bonds"=>60104092}}, "AD"=>{"date"=>"2033-01-01", "type"=>"_401k", "balances"=>{"stocks"=>29109501, "bonds"=>27804806}}}, "cashflow"=>{"pretax_w2"=>2325000, "pretax_ss"=>5748788, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>1627500, "posttax_ss"=>5748788, "posttax"=>12511572, "withdrawal"=>5135284}}, 
      {"date"=>"2034-01-01", "accounts"=>{"AA"=>{"date"=>"2034-01-01", "type"=>"_401k", "balances"=>{"stocks"=>62521805, "bonds"=>61342147}}, "AD"=>{"date"=>"2034-01-01", "type"=>"_401k", "balances"=>{"stocks"=>29575372, "bonds"=>28765967}}}, "cashflow"=>{"pretax_ss"=>6271764, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6271764, "posttax"=>12761796, "withdrawal"=>6490032}}, 
      {"date"=>"2035-01-01", "accounts"=>{"AA"=>{"date"=>"2035-01-01", "type"=>"_401k", "balances"=>{"stocks"=>63360782, "bonds"=>62165300}}, "AD"=>{"date"=>"2035-01-01", "type"=>"_401k", "balances"=>{"stocks"=>29843657, "bonds"=>29280570}}}, "cashflow"=>{"pretax_ss"=>6397200, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6397200, "posttax"=>13017036, "withdrawal"=>6619836}}, 
      {"date"=>"2036-01-01", "accounts"=>{"AA"=>{"date"=>"2036-01-01", "type"=>"_401k", "balances"=>{"stocks"=>64195970, "bonds"=>62984726}}, "AD"=>{"date"=>"2036-01-01", "type"=>"_401k", "balances"=>{"stocks"=>30237041, "bonds"=>29666529}}}, "cashflow"=>{"pretax_ss"=>6525144, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6525144, "posttax"=>13277376, "withdrawal"=>6752232}}, 
      {"date"=>"2037-01-01", "accounts"=>{"AA"=>{"date"=>"2037-01-01", "type"=>"_401k", "balances"=>{"stocks"=>65036907, "bonds"=>63806467}}, "AD"=>{"date"=>"2037-01-01", "type"=>"_401k", "balances"=>{"stocks"=>30633128, "bonds"=>30053574}}}, "cashflow"=>{"pretax_ss"=>6655644, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6655644, "posttax"=>13542924, "withdrawal"=>6887280}}, 
      {"date"=>"2038-01-01", "accounts"=>{"AA"=>{"date"=>"2038-01-01", "type"=>"_401k", "balances"=>{"stocks"=>65859890, "bonds"=>64617247}}, "AD"=>{"date"=>"2038-01-01", "type"=>"_401k", "balances"=>{"stocks"=>31020761, "bonds"=>30435462}}}, "cashflow"=>{"pretax_ss"=>6788760, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6788760, "posttax"=>13813788, "withdrawal"=>7025028}}, 
      {"date"=>"2039-01-01", "accounts"=>{"AA"=>{"date"=>"2039-01-01", "type"=>"_401k", "balances"=>{"stocks"=>66677243, "bonds"=>65419181}}, "AD"=>{"date"=>"2039-01-01", "type"=>"_401k", "balances"=>{"stocks"=>31405740, "bonds"=>30813180}}}, "cashflow"=>{"pretax_ss"=>6924528, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6924528, "posttax"=>14090064, "withdrawal"=>7165536}}, 
      {"date"=>"2040-01-01", "accounts"=>{"AA"=>{"date"=>"2040-01-01", "type"=>"_401k", "balances"=>{"stocks"=>67485947, "bonds"=>66212630}}, "AD"=>{"date"=>"2040-01-01", "type"=>"_401k", "balances"=>{"stocks"=>31786647, "bonds"=>31186899}}}, "cashflow"=>{"pretax_ss"=>7063032, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7063032, "posttax"=>14371860, "withdrawal"=>7308828}}, 
      {"date"=>"2041-01-01", "accounts"=>{"AA"=>{"date"=>"2041-01-01", "type"=>"_401k", "balances"=>{"stocks"=>68295777, "bonds"=>67003682}}, "AD"=>{"date"=>"2041-01-01", "type"=>"_401k", "balances"=>{"stocks"=>32168088, "bonds"=>31559494}}}, "cashflow"=>{"pretax_ss"=>7204284, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7204284, "posttax"=>14659296, "withdrawal"=>7455012}}, 
      {"date"=>"2042-01-01", "accounts"=>{"AA"=>{"date"=>"2042-01-01", "type"=>"_401k", "balances"=>{"stocks"=>69081542, "bonds"=>67778117}}, "AD"=>{"date"=>"2042-01-01", "type"=>"_401k", "balances"=>{"stocks"=>32538191, "bonds"=>31924264}}}, "cashflow"=>{"pretax_ss"=>7348368, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7348368, "posttax"=>14952480, "withdrawal"=>7604112}}, 
      {"date"=>"2043-01-01", "accounts"=>{"AA"=>{"date"=>"2043-01-01", "type"=>"_401k", "balances"=>{"stocks"=>69855903, "bonds"=>68537867}}, "AD"=>{"date"=>"2043-01-01", "type"=>"_401k", "balances"=>{"stocks"=>32902926, "bonds"=>32282118}}}, "cashflow"=>{"pretax_ss"=>7495332, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7495332, "posttax"=>15251532, "withdrawal"=>7756200}}, 
      {"date"=>"2044-01-01", "accounts"=>{"AA"=>{"date"=>"2044-01-01", "type"=>"_401k", "balances"=>{"stocks"=>70615382, "bonds"=>69283018}}, "AD"=>{"date"=>"2044-01-01", "type"=>"_401k", "balances"=>{"stocks"=>33260654, "bonds"=>32633097}}}, "cashflow"=>{"pretax_ss"=>7645236, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7645236, "posttax"=>15556560, "withdrawal"=>7911324}}, 
      {"date"=>"2045-01-01", "accounts"=>{"AA"=>{"date"=>"2045-01-01", "type"=>"_401k", "balances"=>{"stocks"=>71369877, "bonds"=>70019625}}, "AD"=>{"date"=>"2045-01-01", "type"=>"_401k", "balances"=>{"stocks"=>33616027, "bonds"=>32980043}}}, "cashflow"=>{"pretax_ss"=>7798152, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7798152, "posttax"=>15867696, "withdrawal"=>8069544}}, 
      {"date"=>"2046-01-01", "accounts"=>{"AA"=>{"date"=>"2046-01-01", "type"=>"_401k", "balances"=>{"stocks"=>72092699, "bonds"=>70732457}}, "AD"=>{"date"=>"2046-01-01", "type"=>"_401k", "balances"=>{"stocks"=>33956489, "bonds"=>33315799}}}, "cashflow"=>{"pretax_ss"=>7954116, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7954116, "posttax"=>16185048, "withdrawal"=>8230932}}, 
      {"date"=>"2047-01-01", "accounts"=>{"AA"=>{"date"=>"2047-01-01", "type"=>"_401k", "balances"=>{"stocks"=>72796727, "bonds"=>71423202}}, "AD"=>{"date"=>"2047-01-01", "type"=>"_401k", "balances"=>{"stocks"=>34288090, "bonds"=>33641146}}}, "cashflow"=>{"pretax_ss"=>8113200, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8113200, "posttax"=>16508748, "withdrawal"=>8395548}}, 
      {"date"=>"2048-01-01", "accounts"=>{"AA"=>{"date"=>"2048-01-01", "type"=>"_401k", "balances"=>{"stocks"=>73477943, "bonds"=>72091567}}, "AD"=>{"date"=>"2048-01-01", "type"=>"_401k", "balances"=>{"stocks"=>34608952, "bonds"=>33955951}}}, "cashflow"=>{"pretax_ss"=>8275464, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8275464, "posttax"=>16838928, "withdrawal"=>8563464}}, 
      {"date"=>"2049-01-01", "accounts"=>{"AA"=>{"date"=>"2049-01-01", "type"=>"_401k", "balances"=>{"stocks"=>74146218, "bonds"=>72743437}}, "AD"=>{"date"=>"2049-01-01", "type"=>"_401k", "balances"=>{"stocks"=>34923715, "bonds"=>34262988}}}, "cashflow"=>{"pretax_ss"=>8440968, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8440968, "posttax"=>17175708, "withdrawal"=>8734740}}, 
      {"date"=>"2050-01-01", "accounts"=>{"AA"=>{"date"=>"2050-01-01", "type"=>"_401k", "balances"=>{"stocks"=>74773365, "bonds"=>73362551}}, "AD"=>{"date"=>"2050-01-01", "type"=>"_401k", "balances"=>{"stocks"=>35219106, "bonds"=>34554594}}}, "cashflow"=>{"pretax_ss"=>8609784, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8609784, "posttax"=>17519220, "withdrawal"=>8909436}}, 
      {"date"=>"2051-01-01", "accounts"=>{"AA"=>{"date"=>"2051-01-01", "type"=>"_401k", "balances"=>{"stocks"=>75372321, "bonds"=>73950200}}, "AD"=>{"date"=>"2051-01-01", "type"=>"_401k", "balances"=>{"stocks"=>35501221, "bonds"=>34831386}}}, "cashflow"=>{"pretax_ss"=>8781984, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8781984, "posttax"=>17869596, "withdrawal"=>9087612}}, 
      {"date"=>"2052-01-01", "accounts"=>{"AA"=>{"date"=>"2052-01-01", "type"=>"_401k", "balances"=>{"stocks"=>75938430, "bonds"=>74505628}}, "AD"=>{"date"=>"2052-01-01", "type"=>"_401k", "balances"=>{"stocks"=>35767865, "bonds"=>35093008}}}, "cashflow"=>{"pretax_ss"=>8957616, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8957616, "posttax"=>18226992, "withdrawal"=>9269376}}, 
      {"date"=>"2053-01-01", "accounts"=>{"AA"=>{"date"=>"2053-01-01", "type"=>"_401k", "balances"=>{"stocks"=>76481362, "bonds"=>75034400}}, "AD"=>{"date"=>"2053-01-01", "type"=>"_401k", "balances"=>{"stocks"=>36023601, "bonds"=>35342065}}}, "cashflow"=>{"pretax_ss"=>9136776, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9136776, "posttax"=>18591528, "withdrawal"=>9454752}}, 
      {"date"=>"2054-01-01", "accounts"=>{"AA"=>{"date"=>"2054-01-01", "type"=>"_401k", "balances"=>{"stocks"=>76971470, "bonds"=>75519175}}, "AD"=>{"date"=>"2054-01-01", "type"=>"_401k", "balances"=>{"stocks"=>36254446, "bonds"=>35570400}}}, "cashflow"=>{"pretax_ss"=>9319512, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9319512, "posttax"=>18963360, "withdrawal"=>9643848}}, 
      {"date"=>"2055-01-01", "accounts"=>{"AA"=>{"date"=>"2055-01-01", "type"=>"_401k", "balances"=>{"stocks"=>77421521, "bonds"=>75960738}}, "AD"=>{"date"=>"2055-01-01", "type"=>"_401k", "balances"=>{"stocks"=>36466423, "bonds"=>35778375}}}, "cashflow"=>{"pretax_ss"=>9505896, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9505896, "posttax"=>19342632, "withdrawal"=>9836736}}, 
      {"date"=>"2056-01-01", "accounts"=>{"AA"=>{"date"=>"2056-01-01", "type"=>"_401k", "balances"=>{"stocks"=>77826098, "bonds"=>76357681}}, "AD"=>{"date"=>"2056-01-01", "type"=>"_401k", "balances"=>{"stocks"=>36656984, "bonds"=>35965342}}}, "cashflow"=>{"pretax_ss"=>9696024, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9696024, "posttax"=>19729488, "withdrawal"=>10033464}}, 
      {"date"=>"2057-01-01", "accounts"=>{"AA"=>{"date"=>"2057-01-01", "type"=>"_401k", "balances"=>{"stocks"=>78194455, "bonds"=>76715083}}, "AD"=>{"date"=>"2057-01-01", "type"=>"_401k", "balances"=>{"stocks"=>36830479, "bonds"=>36133678}}}, "cashflow"=>{"pretax_ss"=>9889944, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9889944, "posttax"=>20124072, "withdrawal"=>10234128}}, 
      {"date"=>"2058-01-01", "accounts"=>{"AA"=>{"date"=>"2058-01-01", "type"=>"_401k", "balances"=>{"stocks"=>78495515, "bonds"=>77014468}}, "AD"=>{"date"=>"2058-01-01", "type"=>"_401k", "balances"=>{"stocks"=>36972282, "bonds"=>36274690}}}, "cashflow"=>{"pretax_ss"=>10087740, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10087740, "posttax"=>20526552, "withdrawal"=>10438812}}, 
      {"date"=>"2059-01-01", "accounts"=>{"AA"=>{"date"=>"2059-01-01", "type"=>"_401k", "balances"=>{"stocks"=>78741619, "bonds"=>77255925}}, "AD"=>{"date"=>"2059-01-01", "type"=>"_401k", "balances"=>{"stocks"=>37088201, "bonds"=>36388424}}}, "cashflow"=>{"pretax_ss"=>10289496, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10289496, "posttax"=>20937084, "withdrawal"=>10647588}}, 
      {"date"=>"2060-01-01", "accounts"=>{"AA"=>{"date"=>"2060-01-01", "type"=>"_401k", "balances"=>{"stocks"=>78926454, "bonds"=>77437271}}, "AD"=>{"date"=>"2060-01-01", "type"=>"_401k", "balances"=>{"stocks"=>37175267, "bonds"=>36473839}}}, "cashflow"=>{"pretax_ss"=>10495284, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10495284, "posttax"=>21355824, "withdrawal"=>10860540}}, 
      {"date"=>"2061-01-01", "accounts"=>{"AA"=>{"date"=>"2061-01-01", "type"=>"_401k", "balances"=>{"stocks"=>79058526, "bonds"=>77562807}}, "AD"=>{"date"=>"2061-01-01", "type"=>"_401k", "balances"=>{"stocks"=>37237476, "bonds"=>36532976}}}, "cashflow"=>{"pretax_ss"=>10705188, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10705188, "posttax"=>21782940, "withdrawal"=>11077752}}, 
      {"date"=>"2062-01-01", "accounts"=>{"AA"=>{"date"=>"2062-01-01", "type"=>"_401k", "balances"=>{"stocks"=>79105470, "bonds"=>77612910}}, "AD"=>{"date"=>"2062-01-01", "type"=>"_401k", "balances"=>{"stocks"=>37259589, "bonds"=>36556578}}}, "cashflow"=>{"pretax_ss"=>10919280, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10919280, "posttax"=>22218600, "withdrawal"=>11299320}}, 
      {"date"=>"2063-01-01", "accounts"=>{"AA"=>{"date"=>"2063-01-01", "type"=>"_401k", "balances"=>{"stocks"=>79078821, "bonds"=>77586767}}, "AD"=>{"date"=>"2063-01-01", "type"=>"_401k", "balances"=>{"stocks"=>37247045, "bonds"=>36544265}}}, "cashflow"=>{"pretax_ss"=>11137680, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>11137680, "posttax"=>22662972, "withdrawal"=>11525292}}, 
      {"date"=>"2064-01-01", "accounts"=>{"AA"=>{"date"=>"2064-01-01", "type"=>"_401k", "balances"=>{"stocks"=>78971209, "bonds"=>77481187}}, "AD"=>{"date"=>"2064-01-01", "type"=>"_401k", "balances"=>{"stocks"=>37196357, "bonds"=>36494539}}}, "cashflow"=>{"pretax_ss"=>11360436, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>11360436, "posttax"=>23116236, "withdrawal"=>11755800}}, 
      {"date"=>"2065-01-01", "accounts"=>{"AA"=>{"date"=>"2065-01-01", "type"=>"_401k", "balances"=>{"stocks"=>78790025, "bonds"=>77299389}}, "AD"=>{"date"=>"2065-01-01", "type"=>"_401k", "balances"=>{"stocks"=>37111014, "bonds"=>36408907}}}, "cashflow"=>nil}
    ]
  end

  def test_expected_results
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      r = FortuneTeller::Benchmark.run.as_json
    end

    result.zip(expected_no_reallocation) do |actual, expected|
      assert_equal actual, expected
    end
  end

  def test_expected_cashflow
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      r = FortuneTeller::Benchmark.run.as_json
    end

    result, expected = [result, expected_no_reallocation].map do |transform|
      transform.map do |r| 
        {date: r["date"], cashflow: r["cashflow"]}
      end
    end

    result.zip(expected) do |a, e|
      assert_equal a, e
    end
  end

  def test_expected_results_5050_allocation
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      sim = FortuneTeller::Benchmark.create_sim
      sim.set_allocation_strategy(:annual, {stocks: [5000], bonds: [5000]})
      context = FortuneTeller::Benchmark.default_context
      sim.simulate(**context)
    end

    result.as_json.zip(expected_5050_reallocation) do |actual, expected|
      assert_equal actual, expected
    end
  end

  def test_expected_cashflow_5050
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      sim = FortuneTeller::Benchmark.create_sim
      sim.set_allocation_strategy(:annual, {stocks: [5000], bonds: [5000]})
      context = FortuneTeller::Benchmark.default_context
      sim.simulate(**context).as_json
    end

    result, expected = [result, expected_5050_reallocation].map do |transform|
      transform.map do |r| 
        {date: r["date"], cashflow: r["cashflow"]}
      end
    end

    result.zip(expected) do |a, e|
      assert_equal a, e
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

    res1.as_json.zip(res2).each do |line1, line2|
      assert_equal line1, line2
    end
  end
end
