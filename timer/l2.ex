#!/usr/bin/expect

# 20 minutes
set timeout -1
set workpath  [lindex $argv 0]
set l1sw [lindex $argv 1]
set test_cfg [lindex $argv 2]
set result_dir [lindex $argv 3]

log_file ./l2_5g.log

###################################################################

spawn su - root
#expect "*#"

expect "*#"
send "cd $workpath;source ./timerenv.sh;cd  $l1sw/bin/nr5g/gnb/testmac/; ./l2.sh --testfile=$test_cfg\r"

####################################################################

#ebbu_pool_event_chain_print_state
expect {
  "All Tests Completed*" {
    send "exit\r"
    send "$workpath/../kill.sh"
    send "---All Tests Completed*\r"
  } timeout {
    send "echo "$l1sw/bin/nr5g/gnb/testmac/; ./l2.sh --testfile=$test_cfg" >> $result_dir/l2_failed.txt"
  }
}
interact
