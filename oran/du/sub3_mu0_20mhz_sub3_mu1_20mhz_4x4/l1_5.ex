#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]; set  oranisa  [lindex $argv 1]
log_file ./l1_5g.log

spawn su - root

expect "*#"
send "cd $workpath/../;source ./ORAN/env.sh $oranisa;cd  $workpath//bin/nr5g/gnb/l1/orancfg/sub3_mu0_20mhz_sub3_mu1_20mhz_4x4/gnb/; ./l1.sh -oru\r"

expect "*welcome"
send "\r"

expect "mem_mgr_display_size:"
send "checking"

expect "mem_mgr_display_size:"
send "\r"

expect "PHY>"
send "exit\r"

expect "*#"
send "exit\r"

expect eof
