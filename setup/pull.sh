#!/bin/bash

if [ $# -ne 2 ];then
   echo "
     discription ./pull.sh flexran_branch dpdk_branch
     example ./pull.sh prod_r21.11 prod_21_11
     "
   exit 0
fi

BRANCH=$1
DPDKBRANCH=$2

clone_repo() {

REPO_DIR=$1
REPO=$2
BRANCH=$3

echo "----------REPO_DIR $REPO_DIR----------------"
echo "----------REPO $REPO----------------"
echo "----------BRANCH $BRANCH----------------"
echo "repo https://github.com/intel-innersource$REPO.git"
#[ ! -d $1 ] && git clone https://github.com/intel-innersource/networking.wireless.flexran.$2.git 
if [ ! -d $REPO_DIR ]; then
  echo "git clone https://github.com/intel-innersource$REPO.git"
  cd $WORK_DIR
  echo "--------clone dir $WORK_DIR--------"
  git clone https://github.com/intel-innersource$REPO.git 
fi
cd ${REPO_DIR}
echo "-----------clone folder: $pwd-------------"
git rm .gitattributes
git reset --hard HEAD
git checkout $BRANCH -f
git pull
cd ..
}

clone_repo $WIRELESS_SDK $wireless_sdk $BRANCH
clone_repo $DIR_WIRELESS_TEST_5G $flexran_l1_5g_test $BRANCH
clone_repo $FLEXRAN_L1_SW $flexran_l1_sw $BRANCH
clone_repo $WIRELESS_CONVERGENCE_L1 $wireless_convergence_l1 $BRANCH
clone_repo $XRAN_DIR $flexran_xran $BRANCH
clone_repo $RTE_SDK $wireless_dpdk_ae $DPDKBRANCH

