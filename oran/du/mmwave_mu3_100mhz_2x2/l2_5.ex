#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]; set  oranisa  [lindex $argv 1]

log_file ./l2_5g.log

###################################################################

spawn su - root
#expect "*#"
#send "cd /$workpath/../;source ./ORAN/env.sh $oranisa\r"

expect "*#"
send "cd $workpath/../;source ./ORAN/env.sh $oranisa;cd  $workpath//bin/nr5g/gnb/testmac/; ./l2.sh -testfile=testmac_clxsp_mu3_100mhz_hton_oru.cfg\r"

####################################################################

expect "All Tests Completed*"
send "$workpath/../kill.sh"
send "---All Tests Completed*\r"

sleep 20
send "exit\r"

interact