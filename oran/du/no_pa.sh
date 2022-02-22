#!/bin/bash

base=$PWD

for i in `ls -d flexran* wireless*`
do
 echo "----------------folder $i-----------------------"

 cd  $base/${i}; git clean -fdx;git reset --hard; git checkout master;git branch;git pull;git status; git checkout prod_r21.07;git pull;git status;
done


cd $base/wireless_dpdk_ae/;  git clean -fdx;git reset --hard;git checkout dpdk_patch-21.07-rc3;git branch;git pull;cd $base

for i in `ls -d flexran* wireless*`
do
 echo "----------------folder $i-----------------------"

 cd  $base/${i}; git branch;git status
done
