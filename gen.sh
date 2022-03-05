if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./gen.sh  prod_r21.11 master
     "
   exit 0
fi

version1=$1
version2=$2

echo "-----------gen c file-----------"
./gen/sdk_gen_c.sh $version2
./gen/1ver_pipline_gen_c.sh $version2
./gen/2ver_pipline_gen_c.sh $version1 $version2

echo "-----------gen html repo-----------"
doxgenfolder=/opt/doxygen-1.8.17/build/bin
export PATH=${doxgenfolder}:$PATH
if [ ! -d $doxgenfolder ]; then
    echo "pls install doxygen-1.8.17 in folder ${doxgenfolder}"
    exit 0
fi 

CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source $CUR_DIR/gen/genenv.sh
output_dir=$CFILE_RESULTS
doxgenfolder=$FLEXRAN_L1_SW/doxygen/nr5g

/usr/bin/cp -r -f $output_dir/* $doxgenfolder/doxygen_perf_src/
cd ${doxgenfolder}
sh gen_doxygen_perf.sh
cd -