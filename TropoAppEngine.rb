# Put this in your hosted (or remote, if you so choose) Tropo.com "AppEngine" script

if $action
  if $network.upcase == 'VOICE'; $to = $to.gsub(/[^\d]/,""); end
  if $network.upcase == 'SMS'; $to = $to.gsub(/[^\d]/,""); end
  session_options = {:channel => $channel, :network => $network}
  call $to, session_options
  say $message
  hangup
else
  answer
  wait 500
  say "Hi there #{$currentCall.callerID}"
  hangup
end