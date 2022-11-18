#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set  l1_dir  [lindex $argv 1] 
log_file ./l1_5g.log

spawn su - root

expect "*#"
send "cd $workpath/../;source ./oranenv.sh; cd  $l1_dir; sh ./l1.sh -oru\r"

expect "Received MSG_TYPE_PHY_SHUTDOWN_REQ"
#send "----------------Received MSG_TYPE_PHY_SHUTDOWN_REQ\r"

expect "Mlog Print successful"
#send "----------------Mlog Print successful\r"
send "\r"
send "exit\r"


expect "mem_mgr_display_size:"
#send "----------------mem_mgr_display_size:\r"
send "exit\r"
expect eof

