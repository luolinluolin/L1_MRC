#!/usr/bin/expect

set timeout -1
set ru_dir  [lindex $argv 0]

log_file ./$case.log
spawn su - root

expect "*#"

send "cd $ru_dir;sh ./run_o_ru.sh\r"

####################################################################
expect "*quit"
set timeout 200
expect {
   -re "non-existent" {
   send "check\n"
   }
}
send "3\r"
expect "*#"
send "exit\r"
expect eof
