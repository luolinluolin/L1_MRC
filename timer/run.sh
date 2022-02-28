#!/bin/bash
BASE=$1
case=$2

l1_sw=$FLEXRAN_L1_SW

rm -rf $BASE/*.log

./l1.ex $BASE $l1_sw&

sleep 20

./l2.ex $BASE $l1_sw $case

# ./kill.ex $work_path

echo "this DU run script  is done "
