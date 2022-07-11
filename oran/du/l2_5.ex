#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set  l2_dir  [lindex $argv 1]
set  l2_cfg  [lindex $argv 2]


log_file ./l2_5g.log

###################################################################

spawn su - root

expect "*#"
send "cd $workpath/../;source ./oranenv.sh;cd  $l2_dir; ./l2.sh -testfile=$l2_cfg\r"

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
