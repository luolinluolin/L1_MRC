#!/usr/bin/expect

set timeout -1
set ru_dir  [lindex $argv 0]
set case  [lindex $argv 1]
set base [lindex $argv 2]

log_file ./$case.log
spawn su - root

expect "*#"

send "source ${base}/../oranenv.sh; cd $ru_dir;sh ./run_o_ru.sh\r"

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
