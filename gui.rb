%w(yaml open-uri rexml/document cgi helpers.rb).each {|lib| require lib}
config = YAML::load(File.read('config.yaml'))

call_options = {  'to' => "SkramX", 
                  'network' => "aim",
                  'message' => "A Generic Message."    }  
show_fields = call_options.keys
user_set_fields = Hash.new

Shoes.app :title => "Mark's Tropo Session API Script", :width => 320, :height => 500 do
  background "background.jpg"
  @content = stack :margin => 40, :margin_top => 15 do
  subtitle "Tropo Initiate", :margin => 5
  @notifications = stack do end
  @field_stacks = Hash.new
  stack do
    show_fields.each do |field|
      stack :margin => 5 do 
        para field, :margin_bottom => 0, :underline => 'single'
        click do; @field_stacks[field].toggle; end
        @field_stacks[field] = stack :margin => 0 do
          user_set_fields[field] = edit_line :text => call_options.values_at(field)
        end
      end
    end
    @buttons = flow :margin => 5 do
      button "Go!" do
            show_fields.each {|field| call_options[field] = user_set_fields[field].text}
            initiate_return = new_session(call_options,config)
            if initiate_return#xml.root.get_text("success") == true
              @notifications.prepend do
                stack :margin => 10 do
                  background "#d0f0c0"
                  border "#008000", :strokewidth => 4
                  para strong("Success."),"\nSession queued via Tropo", :margin => 6
                  inscription em("click to dismiss all notifications"), :align => 'center'
                  click do; @notifications.clear; end
                end
              end
            else
              @notifications.prepend do
                stack :margin => 10 do
                  background "#FFC0CB"
                  border "#C80815", :strokewidth => 4
                  para strong("Failed to place call."),"\n(Tropo Session API Error)\nReason: \"#{xml.root.get_text("reason")}\"", :margin => 6
                  inscription em("click to dismiss all notifications"), :align => 'center'
                  click do; @notifications.clear; end
                end
              end
          end
      end
      button "Tips and Tricks" do
        alert "- You can click underlined text to toggle its content\r   view (i.e. field names, notifications)
             \n- For more information, contact @Skram at\r   mark@marksilver.net or \'SkramX\' on Freenode IRC"
      end
    end
  end 
  end
end

