#!/bin/bash

./update_conf.sh

rm -rf $PWD/*.log

./l1_5.ex $PWD &

sleep 20

./l2_5.ex $PWD 

./kill.ex $PWD

echo "this DU run script  is done "
