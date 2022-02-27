#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set l1sw [lindex $argv 1]
log_file ./l1_5g.log

spawn su - root
#expect "*#"

expect "*#"
send "cd $workpath;source ../../oranenv.sh;cd  $l1sw/bin/nr5g/gnb/l1/orancfg/sub3_mu0_20mhz_sub6_mu1_100mhz_4x4/gnb/; ./l1.sh -oru\r"

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
