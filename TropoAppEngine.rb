# Put this in your hosted (or remote, if you so choose) Tropo.com "AppEngine" script

options = {
  :channel => $channel,
  :network => $network
}

log "calling number: #{$to}"
call $to, options
say $message
hangup
