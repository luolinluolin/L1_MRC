#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]; set  oranisa  [lindex $argv 1] 
log_file ./l1_5g.log

spawn su - root

expect "*#"
send "cd $workpath/../;source ./ORAN/env.sh $oranisa;cd  $workpath//bin/nr5g/gnb/l1/orancfg/mmwave_mu3_100mhz_2x2/gnb/; ./l1.sh -oru\r"

expect "exit stop waiting for ever"
expect "*welcome"
send "\r"

expect "*#"
send "\r"

send "$workpath/kill.sh\r"

expect eof
disconnect

