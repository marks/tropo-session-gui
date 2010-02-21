%w(yaml helpers.rb excelsior).each {|lib| require lib}
config = YAML::load(File.read('config.yaml'))


fields = ["to","network","message"]
# Sources allowed: CSV string or file
# CSV format: to,from,message
csv_string = <<eos
SkramX,aim,message to you via AIM
SkramX,aim,ANOTHER message to you via AIM '123'
SkramX,aim,"A THIRD message to you via AIM, with a comma even!"
eos
csv_file = File.open('sample.csv', 'rb')

read_csv(fields,csv_string).each do |call_options|
    if new_session(call_options,config) == "true"
      puts "successfully called #{call_options["to"]} via #{call_options["network"]}"
    else
      puts "FAILURE calling #{call_options["to"]} via #{call_options["network"]}"
    end
end

