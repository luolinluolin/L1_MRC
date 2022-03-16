#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set l1sw [lindex $argv 1]

log_file ./l2_5g.log

###################################################################

spawn su - root
#expect "*#"

expect "*#"
send "cd $workpath;source ../../oranenv.sh;cd  $l1sw/bin/nr5g/gnb/testmac/; ./l2.sh -testfile=testmac_clxsp_multi_numerology_oru.cfg\r"

####################################################################

expect "*Completed*"
send "\r"

sleep 5

expect "TESTMAC*"
send "exit\r"

expect "*#"
send "\r"

expect "*#"
send "\r"

expect "*#"
send "exit\r"

interact
