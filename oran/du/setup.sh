#!/bin/bash
base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source $base/../oranenv.sh

##### MBC #######
cd $base;../../setup/mbc_vc_setup.sh
##### NIC #######
cd $base;./nic_vf_du.sh