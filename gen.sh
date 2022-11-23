if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./gen.sh  prod_r21.11 prod_r22.03
     "
   exit 0
fi

version1=$1
version2=$2

echo "-----------gen c file-----------"
./gen/sdk_gen_c.sh $version2
./gen/1ver_pipline_gen_c.sh $version2
./gen/2ver_pipline_gen_c.sh $version1 $version2
./gen/rct_gen.sh $version2 software_ldpc
./gen/rct_gen.sh $version2 hardware_ldpc
# ./gen/rct_gen_2v.sh $version1 $version2
CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source $CUR_DIR/gen/genenv.sh
echo "------------./gen/rct_gen_2v.sh $rct_platform1 $version1 $rct_platform1 $version2 software_ldpc-----------"
./gen/rct_gen_2v.sh $rct_platform1 $version1 $rct_platform2 $version2 software_ldpc
echo "------------./gen/rct_gen_2v.sh $rct_platform1 $version1 $rct_platform1 $version2 hardware_ldpc-----------"
./gen/rct_gen_2v.sh $rct_platform1 $version1 $rct_platform2 $version2 hardware_ldpc

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

CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
echo "/usr/bin/cp -rf $CUR_DIR/gen/gen_doxygen_perf.sh $FLEXRAN_L1_SW/doxygen/nr5g"
/usr/bin/cp -rf $CUR_DIR/gen/gen_doxygen_perf.sh $FLEXRAN_L1_SW/doxygen/nr5g
/usr/bin/cp -rf $CUR_DIR/gen/doxygen/*.c ${output_dir}
/usr/bin/cp -rf $output_dir/* $doxgenfolder/doxygen_perf_src/
/usr/bin/cp -rf $CUR_DIR/gen/doxygen/*.html $FLEXRAN_L1_SW/doxygen/utils

cd ${doxgenfolder}
sh gen_doxygen_perf.sh
cd -

## move to dst folder
perf_file_name=`date|sed 's/ /_/g'|sed 's/:/_/g'`
perf_file_name=perf_$perf_file_name.tar.gz
html_folder=$RESULT_DIR/html
if [ ! -d $html_folder ]; then
    mkdir -p $html_folder
fi 
echo "----------------/usr/bin/mv $doxgenfolder/perf.tar.gz $html_folder/$perf_file_name---------------------"
/usr/bin/mv $doxgenfolder/perf.tar.gz $html_folder/$perf_file_name
