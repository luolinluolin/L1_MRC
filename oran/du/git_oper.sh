#!/bin/bash

base=$PWD
pa="dan123*CHINA"
op=$1

if [ $op = "update" ]
then

   for i in `ls -d flexran* wireless*`
     do
     echo "----------------folder $i-----------------------"
     cd  $base/${i}; git clean -fdx;git reset --hard; git checkout master;git branch;git pull
   done
     cd $base/wireless_dpdk_ae/; git checkout main_dev;git branch;git pull;cd $base
fi

if [ $op = "change" ]
then

   for i in `ls -d flexran* wireless*`
     do
     echo "----------------folder $i-----------------------"
     cd  $base/${i}; sed -i "s#\(url = https:\/\/zhanghax:\)\(.*\)\(@.*\)#\1${pa}\3#g" .git/config
   done
fi

if [ $op = "clone" ]
then
        #git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/flexran_l1_sw.git
        #git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/flexran_xran.git
        #git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/wireless_sdk.git
        #git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/wireless_convergence_l1.git
        #git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/flexran_l1_5g_test.git
        #git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/wireless_dpdk_ae.git

        git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/flexran_jenkins_framework.git
        #git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/flexran_l1_4g_test.git
        git clone  https://zhanghax:${pa}@gitlab.devtools.intel.com/flexran/flexran_devops_configure.git
fi

if [ $op = "reset" ]
then

   for i in `ls -d flexran* wireless*`
     do
     echo "----------------folder $i-----------------------"
     cd  $base/${i}; git clean -fdx;git reset --hard;git branch;git pull
   done
fi

if [ $op = "check" ]
then

   for i in `ls -d flexran* wireless*`
     do
     echo "----------------folder $i-----------------------"
     cd  $base/${i};git branch
   done
fi
