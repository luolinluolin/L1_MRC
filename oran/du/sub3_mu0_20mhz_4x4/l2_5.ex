#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set l1sw [lindex $argv 1]

log_file ./l2_5g.log

###################################################################

spawn su - root
#expect "*#"

expect "*#"
send "cd $workpath;source ../../oranenv.sh;cd  $l1sw/bin/nr5g/gnb/testmac/; ./l2.sh -testfile=testmac_clxsp_mu0_20mhz_hton_oru.cfg\r"

####################################################################



expect "*Mlog Print successful"
send "---Mlog Print successful\r"

sleep 5

expect "*Completed*"
send "---Completed\r"

expect "All Tests Completed*"
send "---All Tests Completed\r"
send "exit\r"

expect "wls_mac_print_stats*"
send "---wls_mac_print_stats\r"
send "exit\r"

interact
