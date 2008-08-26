params = {
  "51_sig" => "930c44e2be61c82d312d488bcf9c3d1a",
  "51_sig_uid" => "tuxedoking",
  "51_sig_sdk_from" => "php", 
  "51_sig_user" => "tuxedoking",
  "51_sig_session_key" => "4457d9a9873fa57b013d09ecb885952b",
  "51_sig_app_key" => "60b8392d439028a6020f68de6fd65f9f",
  "51_sig_time" => "1219721160",
  "51_sig_method" => "fiveone.friends.get",
  "51_sig_call_id" => "1219721536.43"
}

res = Wuyao::Service.new.post(params)

puts "res: #{res.inspect}"
puts "body: ---#{res.body}---"
