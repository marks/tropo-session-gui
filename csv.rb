%w(yaml helpers.rb excelsior).each {|lib| require lib}
config = YAML::load(File.read('config.yaml'))


fields = ["to","network","message"]
# Sources allowed: CSV string or file
# CSV format: to,from,message
csv_string = <<eos
  SkramX,aim,message to you via AIM
  SkramX,aim,"A 2nd message to you via AIM, with a comma even!"
  1-512.555-1212,sms,test1/1
eos
# Note, these lines can be indented here because we have .gsub(/[^\d]/,"") in TropoAppEngine.rb
#   that regular expression (gsub) is also the reason why we can pass phone numbers in any format like:
#   1-512.555.1234, +1 (512) 555-1235, 1 5 1 2 5 5 51 234
csv_file = File.open('sample.csv', 'rb')

read_csv(fields,csv_string).each do |call_options|
    if new_session(call_options,config) == "true"
      puts "successfully called #{call_options["to"]} via #{call_options["network"]}"
    else
      puts "FAILURE calling #{call_options["to"]} via #{call_options["network"]}"
    end
end