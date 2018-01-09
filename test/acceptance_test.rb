require 'test_helper'

class AcceptanceTest < Minitest::Test

  def expected_no_reallocation
    [
      {"date"=>"2017-12-14", "accounts"=>{"AA"=>{"date"=>"2017-12-14", "balances"=>{"stocks"=>30000000, "bonds"=>20000000}}, "AD"=>{"date"=>"2017-12-14", "balances"=>{"stocks"=>20000000}}}, "cashflow"=>{"w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>0, "posttax"=>0}}, 
      {"date"=>"2018-01-01", "accounts"=>{"AA"=>{"date"=>"2018-01-01", "balances"=>{"stocks"=>30086330, "bonds"=>20038721}}, "AD"=>{"date"=>"2018-01-01", "balances"=>{"stocks"=>20057553}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2019-01-01", "accounts"=>{"AA"=>{"date"=>"2019-01-01", "balances"=>{"stocks"=>32923847, "bonds"=>20840269}}, "AD"=>{"date"=>"2019-01-01", "balances"=>{"stocks"=>22035261}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2020-01-01", "accounts"=>{"AA"=>{"date"=>"2020-01-01", "balances"=>{"stocks"=>35931615, "bonds"=>21673878}}, "AD"=>{"date"=>"2020-01-01", "balances"=>{"stocks"=>24131633}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2021-01-01", "accounts"=>{"AA"=>{"date"=>"2021-01-01", "balances"=>{"stocks"=>39125958, "bonds"=>22543255}}, "AD"=>{"date"=>"2021-01-01", "balances"=>{"stocks"=>26357891}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2022-01-01", "accounts"=>{"AA"=>{"date"=>"2022-01-01", "balances"=>{"stocks"=>42505851, "bonds"=>23444986}}, "AD"=>{"date"=>"2022-01-01", "balances"=>{"stocks"=>28713621}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2023-01-01", "accounts"=>{"AA"=>{"date"=>"2023-01-01", "balances"=>{"stocks"=>46088541, "bonds"=>24382785}}, "AD"=>{"date"=>"2023-01-01", "balances"=>{"stocks"=>31210694}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2024-01-01", "accounts"=>{"AA"=>{"date"=>"2024-01-01", "balances"=>{"stocks"=>49886191, "bonds"=>25358095}}, "AD"=>{"date"=>"2024-01-01", "balances"=>{"stocks"=>33857592}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2025-01-01", "accounts"=>{"AA"=>{"date"=>"2025-01-01", "balances"=>{"stocks"=>53920171, "bonds"=>26375254}}, "AD"=>{"date"=>"2025-01-01", "balances"=>{"stocks"=>36669054}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2026-01-01", "accounts"=>{"AA"=>{"date"=>"2026-01-01", "balances"=>{"stocks"=>58187720, "bonds"=>27430264}}, "AD"=>{"date"=>"2026-01-01", "balances"=>{"stocks"=>39643454}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2027-01-01", "accounts"=>{"AA"=>{"date"=>"2027-01-01", "balances"=>{"stocks"=>62711320, "bonds"=>28527474}}, "AD"=>{"date"=>"2027-01-01", "balances"=>{"stocks"=>42796318}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2028-01-01", "accounts"=>{"AA"=>{"date"=>"2028-01-01", "balances"=>{"stocks"=>67506337, "bonds"=>29668574}}, "AD"=>{"date"=>"2028-01-01", "balances"=>{"stocks"=>46138353}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2029-01-01", "accounts"=>{"AA"=>{"date"=>"2029-01-01", "balances"=>{"stocks"=>72600506, "bonds"=>30858632}}, "AD"=>{"date"=>"2029-01-01", "balances"=>{"stocks"=>49688739}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2030-01-01", "accounts"=>{"AA"=>{"date"=>"2030-01-01", "balances"=>{"stocks"=>77988874, "bonds"=>32092978}}, "AD"=>{"date"=>"2030-01-01", "balances"=>{"stocks"=>53444320}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2031-01-01", "accounts"=>{"AA"=>{"date"=>"2031-01-01", "balances"=>{"stocks"=>83700544, "bonds"=>33376696}}, "AD"=>{"date"=>"2031-01-01", "balances"=>{"stocks"=>57425236}}}, "cashflow"=>{"pretax_w2"=>8525000, "pretax_ss"=>3963850, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>5967500, "posttax_ss"=>3963850, "posttax"=>11920190, "withdrawal"=>1988840}}, 
      {"date"=>"2032-01-01", "accounts"=>{"AA"=>{"date"=>"2032-01-01", "balances"=>{"stocks"=>87433027, "bonds"=>34139430}}, "AD"=>{"date"=>"2032-01-01", "balances"=>{"stocks"=>61645006}}}, "cashflow"=>{"pretax_w2"=>6975000, "pretax_ss"=>4851756, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>4882500, "posttax_ss"=>4851756, "posttax"=>12266244, "withdrawal"=>2531988}}, 
      {"date"=>"2033-01-01", "accounts"=>{"AA"=>{"date"=>"2033-01-01", "balances"=>{"stocks"=>90809345, "bonds"=>34786930}}, "AD"=>{"date"=>"2033-01-01", "balances"=>{"stocks"=>66128413}}}, "cashflow"=>{"pretax_w2"=>2325000, "pretax_ss"=>5748788, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>1627500, "posttax_ss"=>5748788, "posttax"=>12511572, "withdrawal"=>5135284}}, 
      {"date"=>"2034-01-01", "accounts"=>{"AA"=>{"date"=>"2034-01-01", "balances"=>{"stocks"=>92432037, "bonds"=>34740459}}, "AD"=>{"date"=>"2034-01-01", "balances"=>{"stocks"=>70359225}}}, "cashflow"=>{"pretax_ss"=>6271764, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6271764, "posttax"=>12761796, "withdrawal"=>6490032}}, 
      {"date"=>"2035-01-01", "accounts"=>{"AA"=>{"date"=>"2035-01-01", "balances"=>{"stocks"=>93096885, "bonds"=>34330145}}, "AD"=>{"date"=>"2035-01-01", "balances"=>{"stocks"=>74580778}}}, "cashflow"=>{"pretax_ss"=>6397200, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6397200, "posttax"=>13017036, "withdrawal"=>6619836}}, 
      {"date"=>"2036-01-01", "accounts"=>{"AA"=>{"date"=>"2036-01-01", "balances"=>{"stocks"=>93678369, "bonds"=>33892786}}, "AD"=>{"date"=>"2036-01-01", "balances"=>{"stocks"=>79055625}}}, "cashflow"=>{"pretax_ss"=>6525144, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6525144, "posttax"=>13277376, "withdrawal"=>6752232}}, 
      {"date"=>"2037-01-01", "accounts"=>{"AA"=>{"date"=>"2037-01-01", "balances"=>{"stocks"=>94184397, "bonds"=>33431179}}, "AD"=>{"date"=>"2037-01-01", "balances"=>{"stocks"=>83812341}}}, "cashflow"=>{"pretax_ss"=>6655644, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6655644, "posttax"=>13542924, "withdrawal"=>6887280}}, 
      {"date"=>"2038-01-01", "accounts"=>{"AA"=>{"date"=>"2038-01-01", "balances"=>{"stocks"=>94576250, "bonds"=>32936868}}, "AD"=>{"date"=>"2038-01-01", "balances"=>{"stocks"=>88841081}}}, "cashflow"=>{"pretax_ss"=>6788760, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6788760, "posttax"=>13813788, "withdrawal"=>7025028}}, 
      {"date"=>"2039-01-01", "accounts"=>{"AA"=>{"date"=>"2039-01-01", "balances"=>{"stocks"=>94859951, "bonds"=>32412355}}, "AD"=>{"date"=>"2039-01-01", "balances"=>{"stocks"=>94171546}}}, "cashflow"=>{"pretax_ss"=>6924528, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6924528, "posttax"=>14090064, "withdrawal"=>7165536}}, 
      {"date"=>"2040-01-01", "accounts"=>{"AA"=>{"date"=>"2040-01-01", "balances"=>{"stocks"=>95026095, "bonds"=>31856503}}, "AD"=>{"date"=>"2040-01-01", "balances"=>{"stocks"=>99821839}}}, "cashflow"=>{"pretax_ss"=>7063032, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7063032, "posttax"=>14371860, "withdrawal"=>7308828}}, 
      {"date"=>"2041-01-01", "accounts"=>{"AA"=>{"date"=>"2041-01-01", "balances"=>{"stocks"=>95080541, "bonds"=>31271713}}, "AD"=>{"date"=>"2041-01-01", "balances"=>{"stocks"=>105828042}}}, "cashflow"=>{"pretax_ss"=>7204284, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7204284, "posttax"=>14659296, "withdrawal"=>7455012}}, 
      {"date"=>"2042-01-01", "accounts"=>{"AA"=>{"date"=>"2042-01-01", "balances"=>{"stocks"=>94981732, "bonds"=>30649798}}, "AD"=>{"date"=>"2042-01-01", "balances"=>{"stocks"=>112177725}}}, "cashflow"=>{"pretax_ss"=>7348368, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7348368, "posttax"=>14952480, "withdrawal"=>7604112}}, 
      {"date"=>"2043-01-01", "accounts"=>{"AA"=>{"date"=>"2043-01-01", "balances"=>{"stocks"=>94733328, "bonds"=>29992853}}, "AD"=>{"date"=>"2043-01-01", "balances"=>{"stocks"=>118908388}}}, "cashflow"=>{"pretax_ss"=>7495332, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7495332, "posttax"=>15251532, "withdrawal"=>7756200}}, 
      {"date"=>"2044-01-01", "accounts"=>{"AA"=>{"date"=>"2044-01-01", "balances"=>{"stocks"=>94323199, "bonds"=>29299555}}, "AD"=>{"date"=>"2044-01-01", "balances"=>{"stocks"=>126042891}}}, "cashflow"=>{"pretax_ss"=>7645236, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7645236, "posttax"=>15556560, "withdrawal"=>7911324}}, 
      {"date"=>"2045-01-01", "accounts"=>{"AA"=>{"date"=>"2045-01-01", "balances"=>{"stocks"=>93754162, "bonds"=>28571819}}, "AD"=>{"date"=>"2045-01-01", "balances"=>{"stocks"=>133626795}}}, "cashflow"=>{"pretax_ss"=>7798152, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7798152, "posttax"=>15867696, "withdrawal"=>8069544}}, 
      {"date"=>"2046-01-01", "accounts"=>{"AA"=>{"date"=>"2046-01-01", "balances"=>{"stocks"=>92981878, "bonds"=>27801816}}, "AD"=>{"date"=>"2046-01-01", "balances"=>{"stocks"=>141644403}}}, "cashflow"=>{"pretax_ss"=>7954116, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7954116, "posttax"=>16185048, "withdrawal"=>8230932}}, 
      {"date"=>"2047-01-01", "accounts"=>{"AA"=>{"date"=>"2047-01-01", "balances"=>{"stocks"=>92006616, "bonds"=>26991154}}, "AD"=>{"date"=>"2047-01-01", "balances"=>{"stocks"=>150143067}}}, "cashflow"=>{"pretax_ss"=>8113200, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8113200, "posttax"=>16508748, "withdrawal"=>8395548}}, 
      {"date"=>"2048-01-01", "accounts"=>{"AA"=>{"date"=>"2048-01-01", "balances"=>{"stocks"=>90812788, "bonds"=>26138273}}, "AD"=>{"date"=>"2048-01-01", "balances"=>{"stocks"=>159151651}}}, "cashflow"=>{"pretax_ss"=>8275464, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8275464, "posttax"=>16838928, "withdrawal"=>8563464}}, 
      {"date"=>"2049-01-01", "accounts"=>{"AA"=>{"date"=>"2049-01-01", "balances"=>{"stocks"=>89398918, "bonds"=>25244511}}, "AD"=>{"date"=>"2049-01-01", "balances"=>{"stocks"=>168727684}}}, "cashflow"=>{"pretax_ss"=>8440968, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8440968, "posttax"=>17175708, "withdrawal"=>8734740}}, 
      {"date"=>"2050-01-01", "accounts"=>{"AA"=>{"date"=>"2050-01-01", "balances"=>{"stocks"=>87717952, "bonds"=>24302484}}, "AD"=>{"date"=>"2050-01-01", "balances"=>{"stocks"=>178851345}}}, "cashflow"=>{"pretax_ss"=>8609784, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8609784, "posttax"=>17519220, "withdrawal"=>8909436}}, 
      {"date"=>"2051-01-01", "accounts"=>{"AA"=>{"date"=>"2051-01-01", "balances"=>{"stocks"=>85765450, "bonds"=>23313209}}, "AD"=>{"date"=>"2051-01-01", "balances"=>{"stocks"=>189582426}}}, "cashflow"=>{"pretax_ss"=>8781984, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8781984, "posttax"=>17869596, "withdrawal"=>9087612}}, 
      {"date"=>"2052-01-01", "accounts"=>{"AA"=>{"date"=>"2052-01-01", "balances"=>{"stocks"=>83521451, "bonds"=>22274870}}, "AD"=>{"date"=>"2052-01-01", "balances"=>{"stocks"=>200957372}}}, "cashflow"=>{"pretax_ss"=>8957616, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8957616, "posttax"=>18226992, "withdrawal"=>9269376}}, 
      {"date"=>"2053-01-01", "accounts"=>{"AA"=>{"date"=>"2053-01-01", "balances"=>{"stocks"=>80978552, "bonds"=>21188095}}, "AD"=>{"date"=>"2053-01-01", "balances"=>{"stocks"=>213048823}}}, "cashflow"=>{"pretax_ss"=>9136776, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9136776, "posttax"=>18591528, "withdrawal"=>9454752}}, 
      {"date"=>"2054-01-01", "accounts"=>{"AA"=>{"date"=>"2054-01-01", "balances"=>{"stocks"=>78087202, "bonds"=>20046071}}, "AD"=>{"date"=>"2054-01-01", "balances"=>{"stocks"=>225831752}}}, "cashflow"=>{"pretax_ss"=>9319512, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9319512, "posttax"=>18963360, "withdrawal"=>9643848}}, 
      {"date"=>"2055-01-01", "accounts"=>{"AA"=>{"date"=>"2055-01-01", "balances"=>{"stocks"=>74836529, "bonds"=>18849096}}, "AD"=>{"date"=>"2055-01-01", "balances"=>{"stocks"=>239381657}}}, "cashflow"=>{"pretax_ss"=>9505896, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9505896, "posttax"=>19342632, "withdrawal"=>9836736}}, 
      {"date"=>"2056-01-01", "accounts"=>{"AA"=>{"date"=>"2056-01-01", "balances"=>{"stocks"=>71200983, "bonds"=>17595044}}, "AD"=>{"date"=>"2056-01-01", "balances"=>{"stocks"=>253744556}}}, "cashflow"=>{"pretax_ss"=>9696024, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9696024, "posttax"=>19729488, "withdrawal"=>10033464}}, 
      {"date"=>"2057-01-01", "accounts"=>{"AA"=>{"date"=>"2057-01-01", "balances"=>{"stocks"=>67165179, "bonds"=>16283711}}, "AD"=>{"date"=>"2057-01-01", "balances"=>{"stocks"=>269012171}}}, "cashflow"=>{"pretax_ss"=>9889944, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9889944, "posttax"=>20124072, "withdrawal"=>10234128}}, 
      {"date"=>"2058-01-01", "accounts"=>{"AA"=>{"date"=>"2058-01-01", "balances"=>{"stocks"=>62677378, "bonds"=>14908963}}, "AD"=>{"date"=>"2058-01-01", "balances"=>{"stocks"=>285152901}}}, "cashflow"=>{"pretax_ss"=>10087740, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10087740, "posttax"=>20526552, "withdrawal"=>10438812}}, 
      {"date"=>"2059-01-01", "accounts"=>{"AA"=>{"date"=>"2059-01-01", "balances"=>{"stocks"=>57718067, "bonds"=>13470257}}, "AD"=>{"date"=>"2059-01-01", "balances"=>{"stocks"=>302262075}}}, "cashflow"=>{"pretax_ss"=>10289496, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10289496, "posttax"=>20937084, "withdrawal"=>10647588}}, 
      {"date"=>"2060-01-01", "accounts"=>{"AA"=>{"date"=>"2060-01-01", "balances"=>{"stocks"=>52254661, "bonds"=>11965107}}, "AD"=>{"date"=>"2060-01-01", "balances"=>{"stocks"=>320397799}}}, "cashflow"=>{"pretax_ss"=>10495284, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10495284, "posttax"=>21355824, "withdrawal"=>10860540}}, 
      {"date"=>"2061-01-01", "accounts"=>{"AA"=>{"date"=>"2061-01-01", "balances"=>{"stocks"=>46261046, "bonds"=>10392304}}, "AD"=>{"date"=>"2061-01-01", "balances"=>{"stocks"=>339675889}}}, "cashflow"=>{"pretax_ss"=>10705188, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10705188, "posttax"=>21782940, "withdrawal"=>11077752}}, 
      {"date"=>"2062-01-01", "accounts"=>{"AA"=>{"date"=>"2062-01-01", "balances"=>{"stocks"=>39683804, "bonds"=>8746557}}, "AD"=>{"date"=>"2062-01-01", "balances"=>{"stocks"=>360056442}}}, "cashflow"=>{"pretax_ss"=>10919280, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10919280, "posttax"=>22218600, "withdrawal"=>11299320}}, 
      {"date"=>"2063-01-01", "accounts"=>{"AA"=>{"date"=>"2063-01-01", "balances"=>{"stocks"=>32491958, "bonds"=>7026309}}, "AD"=>{"date"=>"2063-01-01", "balances"=>{"stocks"=>381659829}}}, "cashflow"=>{"pretax_ss"=>11137680, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>11137680, "posttax"=>22662972, "withdrawal"=>11525292}}, 
      {"date"=>"2064-01-01", "accounts"=>{"AA"=>{"date"=>"2064-01-01", "balances"=>{"stocks"=>24644004, "bonds"=>5228656}}, "AD"=>{"date"=>"2064-01-01", "balances"=>{"stocks"=>404559419}}}, "cashflow"=>{"pretax_ss"=>11360436, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>11360436, "posttax"=>23116236, "withdrawal"=>11755800}}, 
      {"date"=>"2065-01-01", "accounts"=>{"AA"=>{"date"=>"2065-01-01", "balances"=>{"stocks"=>16099646, "bonds"=>3351197}}, "AD"=>{"date"=>"2065-01-01", "balances"=>{"stocks"=>428901449}}}, "cashflow"=>nil}
    ]
  end

  def expected_5050_reallocation
    [
      {"date"=>"2017-12-14", "accounts"=>{"AA"=>{"date"=>"2017-12-14", "balances"=>{"stocks"=>30000000, "bonds"=>20000000}}, "AD"=>{"date"=>"2017-12-14", "balances"=>{"stocks"=>20000000}}}, "cashflow"=>{"w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>0, "posttax"=>0}}, 
      {"date"=>"2018-01-01", "accounts"=>{"AA"=>{"date"=>"2018-01-01", "balances"=>{"stocks"=>25071942, "bonds"=>25048401}}, "AD"=>{"date"=>"2018-01-01", "balances"=>{"stocks"=>10028777, "bonds"=>10019360}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2019-01-01", "accounts"=>{"AA"=>{"date"=>"2019-01-01", "balances"=>{"stocks"=>27596119, "bonds"=>26062578}}, "AD"=>{"date"=>"2019-01-01", "balances"=>{"stocks"=>11399770, "bonds"=>10425031}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2020-01-01", "accounts"=>{"AA"=>{"date"=>"2020-01-01", "balances"=>{"stocks"=>29471446, "bonds"=>27902524}}, "AD"=>{"date"=>"2020-01-01", "balances"=>{"stocks"=>12341401, "bonds"=>11348898}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2021-01-01", "accounts"=>{"AA"=>{"date"=>"2021-01-01", "balances"=>{"stocks"=>31445423, "bonds"=>29837670}}, "AD"=>{"date"=>"2021-01-01", "balances"=>{"stocks"=>13332140, "bonds"=>12320280}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2022-01-01", "accounts"=>{"AA"=>{"date"=>"2022-01-01", "balances"=>{"stocks"=>33512378, "bonds"=>31867206}}, "AD"=>{"date"=>"2022-01-01", "balances"=>{"stocks"=>14370039, "bonds"=>13339257}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2023-01-01", "accounts"=>{"AA"=>{"date"=>"2023-01-01", "balances"=>{"stocks"=>35683517, "bonds"=>33997383}}, "AD"=>{"date"=>"2023-01-01", "balances"=>{"stocks"=>15460182, "bonds"=>14408836}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2024-01-01", "accounts"=>{"AA"=>{"date"=>"2024-01-01", "balances"=>{"stocks"=>37963214, "bonds"=>36234069}}, "AD"=>{"date"=>"2024-01-01", "balances"=>{"stocks"=>16604835, "bonds"=>15531890}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2025-01-01", "accounts"=>{"AA"=>{"date"=>"2025-01-01", "balances"=>{"stocks"=>40363205, "bonds"=>38586732}}, "AD"=>{"date"=>"2025-01-01", "balances"=>{"stocks"=>17809462, "bonds"=>16712892}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2026-01-01", "accounts"=>{"AA"=>{"date"=>"2026-01-01", "balances"=>{"stocks"=>42875803, "bonds"=>41053968}}, "AD"=>{"date"=>"2026-01-01", "balances"=>{"stocks"=>19071104, "bonds"=>17951625}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2027-01-01", "accounts"=>{"AA"=>{"date"=>"2027-01-01", "balances"=>{"stocks"=>45515117, "bonds"=>43643482}}, "AD"=>{"date"=>"2027-01-01", "balances"=>{"stocks"=>20396303, "bonds"=>19251821}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2028-01-01", "accounts"=>{"AA"=>{"date"=>"2028-01-01", "balances"=>{"stocks"=>48286396, "bonds"=>46362473}}, "AD"=>{"date"=>"2028-01-01", "balances"=>{"stocks"=>21787762, "bonds"=>20617026}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2029-01-01", "accounts"=>{"AA"=>{"date"=>"2029-01-01", "balances"=>{"stocks"=>51204275, "bonds"=>49222702}}, "AD"=>{"date"=>"2029-01-01", "balances"=>{"stocks"=>23252403, "bonds"=>22052858}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2030-01-01", "accounts"=>{"AA"=>{"date"=>"2030-01-01", "balances"=>{"stocks"=>54258634, "bonds"=>52222028}}, "AD"=>{"date"=>"2030-01-01", "balances"=>{"stocks"=>24786045, "bonds"=>23558735}}}, "cashflow"=>{"pretax_w2"=>16275000, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>11392500, "posttax_ss"=>0, "posttax"=>11392500}}, 
      {"date"=>"2031-01-01", "accounts"=>{"AA"=>{"date"=>"2031-01-01", "balances"=>{"stocks"=>57467087, "bonds"=>55369945}}, "AD"=>{"date"=>"2031-01-01", "balances"=>{"stocks"=>26396989, "bonds"=>25139285}}}, "cashflow"=>{"pretax_w2"=>8525000, "pretax_ss"=>3963850, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>5967500, "posttax_ss"=>3963850, "posttax"=>11920190, "withdrawal"=>1988840}}, 
      {"date"=>"2032-01-01", "accounts"=>{"AA"=>{"date"=>"2032-01-01", "balances"=>{"stocks"=>58951542, "bonds"=>57669311}}, "AD"=>{"date"=>"2032-01-01", "balances"=>{"stocks"=>28088479, "bonds"=>26798863}}}, "cashflow"=>{"pretax_w2"=>6975000, "pretax_ss"=>4851756, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>4882500, "posttax_ss"=>4851756, "posttax"=>12266244, "withdrawal"=>2531988}}, 
      {"date"=>"2033-01-01", "accounts"=>{"AA"=>{"date"=>"2033-01-01", "balances"=>{"stocks"=>60506298, "bonds"=>59361576}}, "AD"=>{"date"=>"2033-01-01", "balances"=>{"stocks"=>29869214, "bonds"=>28544485}}}, "cashflow"=>{"pretax_w2"=>2325000, "pretax_ss"=>5748788, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>1627500, "posttax_ss"=>5748788, "posttax"=>12511572, "withdrawal"=>5135284}}, 
      {"date"=>"2034-01-01", "accounts"=>{"AA"=>{"date"=>"2034-01-01", "balances"=>{"stocks"=>60878256, "bonds"=>59729612}}, "AD"=>{"date"=>"2034-01-01", "balances"=>{"stocks"=>31222368, "bonds"=>30375123}}}, "cashflow"=>{"pretax_ss"=>6271764, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6271764, "posttax"=>12761796, "withdrawal"=>6490032}}, 
      {"date"=>"2035-01-01", "accounts"=>{"AA"=>{"date"=>"2035-01-01", "balances"=>{"stocks"=>60557807, "bonds"=>59415205}}, "AD"=>{"date"=>"2035-01-01", "balances"=>{"stocks"=>32646671, "bonds"=>32030696}}}, "cashflow"=>{"pretax_ss"=>6397200, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6397200, "posttax"=>13017036, "withdrawal"=>6619836}}, 
      {"date"=>"2036-01-01", "accounts"=>{"AA"=>{"date"=>"2036-01-01", "balances"=>{"stocks"=>60154048, "bonds"=>59019058}}, "AD"=>{"date"=>"2036-01-01", "balances"=>{"stocks"=>34279005, "bonds"=>33632231}}}, "cashflow"=>{"pretax_ss"=>6525144, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6525144, "posttax"=>13277376, "withdrawal"=>6752232}}, 
      {"date"=>"2037-01-01", "accounts"=>{"AA"=>{"date"=>"2037-01-01", "balances"=>{"stocks"=>59671376, "bonds"=>58542441}}, "AD"=>{"date"=>"2037-01-01", "balances"=>{"stocks"=>35998701, "bonds"=>35317638}}}, "cashflow"=>{"pretax_ss"=>6655644, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6655644, "posttax"=>13542924, "withdrawal"=>6887280}}, 
      {"date"=>"2038-01-01", "accounts"=>{"AA"=>{"date"=>"2038-01-01", "balances"=>{"stocks"=>59083029, "bonds"=>57968256}}, "AD"=>{"date"=>"2038-01-01", "balances"=>{"stocks"=>37797660, "bonds"=>37084497}}}, "cashflow"=>{"pretax_ss"=>6788760, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6788760, "posttax"=>13813788, "withdrawal"=>7025028}}, 
      {"date"=>"2039-01-01", "accounts"=>{"AA"=>{"date"=>"2039-01-01", "balances"=>{"stocks"=>58395483, "bonds"=>57293678}}, "AD"=>{"date"=>"2039-01-01", "balances"=>{"stocks"=>39687544, "bonds"=>38938722}}}, "cashflow"=>{"pretax_ss"=>6924528, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>6924528, "posttax"=>14090064, "withdrawal"=>7165536}}, 
      {"date"=>"2040-01-01", "accounts"=>{"AA"=>{"date"=>"2040-01-01", "balances"=>{"stocks"=>57600719, "bonds"=>56513914}}, "AD"=>{"date"=>"2040-01-01", "balances"=>{"stocks"=>41671921, "bonds"=>40885658}}}, "cashflow"=>{"pretax_ss"=>7063032, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7063032, "posttax"=>14371860, "withdrawal"=>7308828}}, 
      {"date"=>"2041-01-01", "accounts"=>{"AA"=>{"date"=>"2041-01-01", "balances"=>{"stocks"=>56701409, "bonds"=>55628666}}, "AD"=>{"date"=>"2041-01-01", "balances"=>{"stocks"=>43762503, "bonds"=>42934555}}}, "cashflow"=>{"pretax_ss"=>7204284, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7204284, "posttax"=>14659296, "withdrawal"=>7455012}}, 
      {"date"=>"2042-01-01", "accounts"=>{"AA"=>{"date"=>"2042-01-01", "balances"=>{"stocks"=>55670341, "bonds"=>54619956}}, "AD"=>{"date"=>"2042-01-01", "balances"=>{"stocks"=>45949441, "bonds"=>45082470}}}, "cashflow"=>{"pretax_ss"=>7348368, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7348368, "posttax"=>14952480, "withdrawal"=>7604112}}, 
      {"date"=>"2043-01-01", "accounts"=>{"AA"=>{"date"=>"2043-01-01", "balances"=>{"stocks"=>54511968, "bonds"=>53483437}}, "AD"=>{"date"=>"2043-01-01", "balances"=>{"stocks"=>48246913, "bonds"=>47336594}}}, "cashflow"=>{"pretax_ss"=>7495332, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7495332, "posttax"=>15251532, "withdrawal"=>7756200}}, 
      {"date"=>"2044-01-01", "accounts"=>{"AA"=>{"date"=>"2044-01-01", "balances"=>{"stocks"=>53216832, "bonds"=>52212741}}, "AD"=>{"date"=>"2044-01-01", "balances"=>{"stocks"=>50659259, "bonds"=>49703424}}}, "cashflow"=>{"pretax_ss"=>7645236, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7645236, "posttax"=>15556560, "withdrawal"=>7911324}}, 
      {"date"=>"2045-01-01", "accounts"=>{"AA"=>{"date"=>"2045-01-01", "balances"=>{"stocks"=>51785251, "bonds"=>50805519}}, "AD"=>{"date"=>"2045-01-01", "balances"=>{"stocks"=>53200715, "bonds"=>52194204}}}, "cashflow"=>{"pretax_ss"=>7798152, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7798152, "posttax"=>15867696, "withdrawal"=>8069544}}, 
      {"date"=>"2046-01-01", "accounts"=>{"AA"=>{"date"=>"2046-01-01", "balances"=>{"stocks"=>50189941, "bonds"=>49242964}}, "AD"=>{"date"=>"2046-01-01", "balances"=>{"stocks"=>55859308, "bonds"=>54805358}}}, "cashflow"=>{"pretax_ss"=>7954116, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>7954116, "posttax"=>16185048, "withdrawal"=>8230932}}, 
      {"date"=>"2047-01-01", "accounts"=>{"AA"=>{"date"=>"2047-01-01", "balances"=>{"stocks"=>48432613, "bonds"=>47518788}}, "AD"=>{"date"=>"2047-01-01", "balances"=>{"stocks"=>58652273, "bonds"=>57545626}}}, "cashflow"=>{"pretax_ss"=>8113200, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8113200, "posttax"=>16508748, "withdrawal"=>8395548}}, 
      {"date"=>"2048-01-01", "accounts"=>{"AA"=>{"date"=>"2048-01-01", "balances"=>{"stocks"=>46502082, "bonds"=>45624683}}, "AD"=>{"date"=>"2048-01-01", "balances"=>{"stocks"=>61584887, "bonds"=>60422908}}}, "cashflow"=>{"pretax_ss"=>8275464, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8275464, "posttax"=>16838928, "withdrawal"=>8563464}}, 
      {"date"=>"2049-01-01", "accounts"=>{"AA"=>{"date"=>"2049-01-01", "balances"=>{"stocks"=>44395555, "bonds"=>43555633}}, "AD"=>{"date"=>"2049-01-01", "balances"=>{"stocks"=>64674456, "bonds"=>63450872}}}, "cashflow"=>{"pretax_ss"=>8440968, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8440968, "posttax"=>17175708, "withdrawal"=>8734740}}, 
      {"date"=>"2050-01-01", "accounts"=>{"AA"=>{"date"=>"2050-01-01", "balances"=>{"stocks"=>42086134, "bonds"=>41292053}}, "AD"=>{"date"=>"2050-01-01", "balances"=>{"stocks"=>67906424, "bonds"=>66625171}}}, "cashflow"=>{"pretax_ss"=>8609784, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8609784, "posttax"=>17519220, "withdrawal"=>8909436}}, 
      {"date"=>"2051-01-01", "accounts"=>{"AA"=>{"date"=>"2051-01-01", "balances"=>{"stocks"=>39571883, "bonds"=>38825243}}, "AD"=>{"date"=>"2051-01-01", "balances"=>{"stocks"=>71301746, "bonds"=>69956430}}}, "cashflow"=>{"pretax_ss"=>8781984, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8781984, "posttax"=>17869596, "withdrawal"=>9087612}}, 
      {"date"=>"2052-01-01", "accounts"=>{"AA"=>{"date"=>"2052-01-01", "balances"=>{"stocks"=>36839558, "bonds"=>36144469}}, "AD"=>{"date"=>"2052-01-01", "balances"=>{"stocks"=>74866833, "bonds"=>73454252}}}, "cashflow"=>{"pretax_ss"=>8957616, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>8957616, "posttax"=>18226992, "withdrawal"=>9269376}}, 
      {"date"=>"2053-01-01", "accounts"=>{"AA"=>{"date"=>"2053-01-01", "balances"=>{"stocks"=>33882331, "bonds"=>33241306}}, "AD"=>{"date"=>"2053-01-01", "balances"=>{"stocks"=>78622726, "bonds"=>77135253}}}, "cashflow"=>{"pretax_ss"=>9136776, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9136776, "posttax"=>18591528, "withdrawal"=>9454752}}, 
      {"date"=>"2054-01-01", "accounts"=>{"AA"=>{"date"=>"2054-01-01", "balances"=>{"stocks"=>30674284, "bonds"=>30095526}}, "AD"=>{"date"=>"2054-01-01", "balances"=>{"stocks"=>82551729, "bonds"=>80994150}}}, "cashflow"=>{"pretax_ss"=>9319512, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9319512, "posttax"=>18963360, "withdrawal"=>9643848}}, 
      {"date"=>"2055-01-01", "accounts"=>{"AA"=>{"date"=>"2055-01-01", "balances"=>{"stocks"=>27208732, "bonds"=>26695356}}, "AD"=>{"date"=>"2055-01-01", "balances"=>{"stocks"=>86679316, "bonds"=>85043858}}}, "cashflow"=>{"pretax_ss"=>9505896, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9505896, "posttax"=>19342632, "withdrawal"=>9836736}}, 
      {"date"=>"2056-01-01", "accounts"=>{"AA"=>{"date"=>"2056-01-01", "balances"=>{"stocks"=>23469906, "bonds"=>23027080}}, "AD"=>{"date"=>"2056-01-01", "balances"=>{"stocks"=>91013282, "bonds"=>89296050}}}, "cashflow"=>{"pretax_ss"=>9696024, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9696024, "posttax"=>19729488, "withdrawal"=>10033464}}, 
      {"date"=>"2057-01-01", "accounts"=>{"AA"=>{"date"=>"2057-01-01", "balances"=>{"stocks"=>19445842, "bonds"=>19077945}}, "AD"=>{"date"=>"2057-01-01", "balances"=>{"stocks"=>95579203, "bonds"=>93770928}}}, "cashflow"=>{"pretax_ss"=>9889944, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>9889944, "posttax"=>20124072, "withdrawal"=>10234128}}, 
      {"date"=>"2058-01-01", "accounts"=>{"AA"=>{"date"=>"2058-01-01", "balances"=>{"stocks"=>15112345, "bonds"=>14827204}}, "AD"=>{"date"=>"2058-01-01", "balances"=>{"stocks"=>100355570, "bonds"=>98462069}}}, "cashflow"=>{"pretax_ss"=>10087740, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10087740, "posttax"=>20526552, "withdrawal"=>10438812}}, 
      {"date"=>"2059-01-01", "accounts"=>{"AA"=>{"date"=>"2059-01-01", "balances"=>{"stocks"=>10456592, "bonds"=>10259299}}, "AD"=>{"date"=>"2059-01-01", "balances"=>{"stocks"=>105373349, "bonds"=>103385173}}}, "cashflow"=>{"pretax_ss"=>10289496, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10289496, "posttax"=>20937084, "withdrawal"=>10647588}}, 
      {"date"=>"2060-01-01", "accounts"=>{"AA"=>{"date"=>"2060-01-01", "balances"=>{"stocks"=>5459825, "bonds"=>5356812}}, "AD"=>{"date"=>"2060-01-01", "balances"=>{"stocks"=>110642017, "bonds"=>108554431}}}, "cashflow"=>{"pretax_ss"=>10495284, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10495284, "posttax"=>21355824, "withdrawal"=>10860540}}, 
      {"date"=>"2061-01-01", "accounts"=>{"AA"=>{"date"=>"2061-01-01", "balances"=>{"stocks"=>103471, "bonds"=>101514}}, "AD"=>{"date"=>"2061-01-01", "balances"=>{"stocks"=>116192665, "bonds"=>113994401}}}, "cashflow"=>{"pretax_ss"=>10705188, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10705188, "posttax"=>21782940, "withdrawal"=>11077752}}, 
      {"date"=>"2062-01-01", "accounts"=>{"AA"=>{"date"=>"2062-01-01", "balances"=>{"stocks"=>0, "bonds"=>0}}, "AD"=>{"date"=>"2062-01-01", "balances"=>{"stocks"=>116365198, "bonds"=>114169630}}}, "cashflow"=>{"pretax_ss"=>10919280, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>10919280, "posttax"=>22218600, "withdrawal"=>11299320}}, 
      {"date"=>"2063-01-01", "accounts"=>{"AA"=>{"date"=>"2063-01-01", "balances"=>{"stocks"=>0, "bonds"=>0}}, "AD"=>{"date"=>"2063-01-01", "balances"=>{"stocks"=>116326011, "bonds"=>114131184}}}, "cashflow"=>{"pretax_ss"=>11137680, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>11137680, "posttax"=>22662972, "withdrawal"=>11525292}}, 
      {"date"=>"2064-01-01", "accounts"=>{"AA"=>{"date"=>"2064-01-01", "balances"=>{"stocks"=>0, "bonds"=>0}}, "AD"=>{"date"=>"2064-01-01", "balances"=>{"stocks"=>116167724, "bonds"=>113975881}}}, "cashflow"=>{"pretax_ss"=>11360436, "w2_rate"=>0.7, "ss_rate"=>1, "posttax_w2"=>0, "posttax_ss"=>11360436, "posttax"=>23116236, "withdrawal"=>11755800}}, 
      {"date"=>"2065-01-01", "accounts"=>{"AA"=>{"date"=>"2065-01-01", "balances"=>{"stocks"=>0, "bonds"=>0}}, "AD"=>{"date"=>"2065-01-01", "balances"=>{"stocks"=>115901206, "bonds"=>113708455}}}, "cashflow"=>nil}
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

  def test_expected_results_nil_allocation
    result = Timecop.freeze(Date.parse('2017-12-14')) do
      sim = FortuneTeller::Benchmark.create_sim
      sim.add_allocation_strategy(allocations: [nil])
      context = FortuneTeller::Benchmark.default_context
      sim.simulate(**context)
    end

    result.as_json.zip(expected_no_reallocation) do |actual, expected|
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

    result.as_json.zip(expected_5050_reallocation) do |actual, expected|
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

    res1.as_json.zip(res2).each do |line1, line2|
      assert_equal line1, line2
    end
  end
end
