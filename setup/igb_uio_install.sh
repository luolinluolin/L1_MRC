BASE=${WORK_DIR}/..
cd $BASE
if [ ! -d dpdk-kmods ];then
  git clone http://dpdk.org/git/dpdk-kmods
fi

if [ ! -f $BASE/dpdk-kmods/linux/igb_uio/igb_uio.ko ]
then
   echo "........start to build igb ko file ...."
   cd $BASE/dpdk-kmods/linux/igb_uio/; make clean;make
fi

if [ `lsmod |awk '{print $1}'|grep igb_uio|wc -l` -eq 0 ]
then
    modprobe uio
    insmod  $BASE/dpdk-kmods/linux/igb_uio/igb_uio.ko
fi