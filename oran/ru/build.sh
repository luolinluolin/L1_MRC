#!/bin/bash

base=$PWD

source /etc/profile

cd $base;./meson_build.sh ; source ./setup/env.sh $ORANISA ;  cd ./flexran_l1_sw/;./flexran_build.sh -v -e -i avx512 -r 5gnr  -m all
cd $base

echo "start to build sample-du..."
cd $base;./sample.sh
cd $base
