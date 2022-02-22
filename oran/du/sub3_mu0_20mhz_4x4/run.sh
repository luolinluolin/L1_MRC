#!/bin/bash
work_path=$FLEXRAN_L1_SW

./update_conf.sh

rm -rf $work_path/*.log

./l1_5.ex $work_path &

sleep 20

./l2_5.ex $work_path 

# ./kill.ex $PWD
echo "this DU run script  is done "

