#!/usr/bin/expect

set timeout -1
set workpath  [lindex $argv 0]
set  l1_dir  [lindex $argv 1] 
log_file ./l1_5g.log

spawn su - root

expect "*#"
send "cd $workpath/../;source ./oranenv.sh; cd  $l1_dir; ./l1.sh -oru\r"

expect "*welcome"
send "\r"

expect "mem_mgr_display_size:"
send "checking"

expect "mem_mgr_display_size:"
send "\r"

#expect "wls_layer_close:Done"
#send "exit\r"

expect eof

