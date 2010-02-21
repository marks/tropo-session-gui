# This file is a barebones of what you need to simply execute a call.

%w(yaml helpers.rb excelsior).each {|lib| require lib}
config = YAML::load(File.read('config.yaml'))
call_options = {  'to' => "SkramX", 
                  'network' => "aim",
                  'message' => "A Generic Message."    }  
new_session(call_options,config)