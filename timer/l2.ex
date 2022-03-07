#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set l1sw [lindex $argv 1]
set test_cfg [lindex $argv 2]

log_file ./l2_5g.log

###################################################################

spawn su - root
#expect "*#"

expect "*#"
send "cd $workpath;source ./timerenv.sh;cd  $l1sw/bin/nr5g/gnb/testmac/; ./l2.sh --testfile=$test_cfg\r"

####################################################################

expect "All Tests Completed*"
sleep 20
send "exit\r"
send "$workpath/../kill.sh"
send "---All Tests Completed*\r"
interact
