#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set l1sw [lindex $argv 1]
log_file ./l1_5g.log

spawn su - root
#expect "*#"

expect "*#"
send "cd $workpath;source ./timerenv.sh;cd  $l1sw/bin/nr5g/gnb/l1/; ./l1.sh -e\r"

expect "Mlog Print successful"
send "\r"

expect "mem_mgr_display_size:"
send "checking"

expect "mem_mgr_display_size:"
send "\r"

expect "PHY>"
send "exit\r"

expect "wls_layer_close:Done"
send "exit\r"

expect eof
