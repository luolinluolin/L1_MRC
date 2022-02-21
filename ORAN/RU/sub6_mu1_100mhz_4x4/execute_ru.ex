#!/usr/bin/expect

set timeout -1
set work_path  [lindex $argv 0]
log_file ./sub6_mu1_100mhz_4x4.log
spawn su - root

expect "*#"
send "cd $work_path/;./update_ru.sh\r"

expect "*#"
send "cd $work_path/../;source ./ORAN/env.sh; cd $work_path//bin/nr5g/gnb/l1/orancfg/sub6_mu1_100mhz_4x4/oru/; sh ./run_o_ru.sh \r"

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
