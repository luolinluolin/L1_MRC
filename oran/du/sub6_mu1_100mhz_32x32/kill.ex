#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]; set  oranisa  [lindex $argv 1]

spawn su - root
expect "*#"
send "$workpath/kill.sh\r"
expect "*#"
send "exit\r"
expect eof
