# Put this in your hosted (or remote, if you so choose) Tropo.com "AppEngine" script

if $action
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