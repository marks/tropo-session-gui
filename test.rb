# This file is a barebones of what you need to simply execute a call.

%w(yaml open-uri rexml/document cgi helpers.rb).each {|lib| require lib}
config = YAML::load(File.read('config.yaml'))
call_options = {  'to' => "SkramX", 
                  'network' => "aim",
                  'message' => "A Generic Message."    }  
new_session(call_options,config)