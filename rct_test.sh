source timer/timerenv.sh	
export CPA_DIR="$FLEXRAN_L1_SW/libs/cpa"
cd $DIR_WIRELESS_TEST_5G
./c_master.sh rctul 1 0 5 
./c_master.sh rctul 1 0 10 
./c_master.sh rctul 1 0 20 
./c_master.sh rctul 1 1 10 
./c_master.sh rctul 1 1 20 
./c_master.sh rctul 1 1 40
./c_master.sh rctul 1 1 100