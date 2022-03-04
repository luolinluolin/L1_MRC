#!/usr/bin/expect

set timeout -1
set work_path  [lindex $argv 0]
set l1sw  [lindex $argv 1]
log_file ./sub3_mu0_20mhz_sub6_mu1_100mhz_4x4.log
spawn su - root

expect "*#"
send "cd $work_path/;source ../../oranenv.sh;./update_ru.sh $l1sw\r"

expect "*#"
send "cd $work_path/;source ../../oranenv.sh; cd $l1sw/bin/nr5g/gnb/l1/orancfg/sub3_mu0_20mhz_sub6_mu1_100mhz_4x4/oru/;sh ./run_o_ru.sh\r"

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
