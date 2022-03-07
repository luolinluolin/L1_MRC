#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set l1sw [lindex $argv 1]

log_file ./l2_5g.log

###################################################################

spawn su - root
#expect "*#"

expect "*#"
send "cd $workpath;source ../../oranenv.sh;cd  $l1sw/bin/nr5g/gnb/testmac/; ./l2.sh -testfile=testmac_clxsp_mu1_100mhz_hton_oru.cfg\r"

####################################################################

expect "All Tests Completed*"
sleep 20
send "exit\r"
send "$workpath/../kill.sh"
send "---All Tests Completed*\r"
interact