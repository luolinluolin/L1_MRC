
if [ $# -ne 1 ] || [ $1 = "-h" ];then
    echo "
         example : ./genc_sdk.sh  prod_r21.11
     "
   exit 0
fi

version=$1
CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source $CUR_DIR/genenv.sh
source $CUR_DIR/../var/timervar.sh

perf_report=$mrc_perf_dir/perf_report
TEST_RESULT=$pipline_results_dir/../
output_dir=$CFILE_RESULTS

cd $mrc_perf_dir;chmod +x build.sh;./build.sh
cd $sdk_tool_dir;chmod +x build.sh;./build.sh

result=results.csv

if [ ! -d $output_dir ]; then
    mkdir -p $output_dir
fi
gen_c_common() {
    platform=$1
    info=$2
    cfile=$3
    cd $sdk_tool_dir;
    if [ -f $result ]
    then
        rm -rf $result
    fi  
    ./sdk_results_parse $SDK_RESULTS/$platform/$version 0
    $perf_report sdk ${sdk_tool_dir}/${result} $info $output_dir/$cfile.c
}



gen_c_common "cslsp" $version "CLXSP Sdk" "ref_clxsp_sdk"
gen_c_common "iclsp" $version "ICXSP Sdk" "ref_icxsp_sdk"
gen_c_common "icld" $version "ICXD Sdk" "ref_icxd_sdk"