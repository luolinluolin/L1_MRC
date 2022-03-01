if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./timer_perf.sh  cslsp prod_r21.11
         example : ./timer_perf.sh  iclsp prod_r21.11
         example : ./timer_perf.sh  icld prod_r21.11
     "
   exit 0
fi
platform=$1
version=$2

./timer/do_sdk_perf.sh $platform $version
./timer/do_pipline_perf.sh $platform $version
