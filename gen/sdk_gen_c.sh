#!/bin/bash

if [ $# -ne 1 ] || [ $1 = "-h" ];then
    echo "
         example : ./sdk_gen_c.sh  prod_r21.11
     "
   exit 0
fi

version=$1
CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source $CUR_DIR/genenv.sh
source $CUR_DIR/../var/var.sh

# perf_report=$mrc_perf_dir/perf_report
output_dir=$CFILE_RESULTS

echo "cd $mrc_perf_dir;chmod +x build.sh;./build.sh"
cd $mrc_perf_dir;chmod +x build.sh;./build.sh
echo "cd $sdk_tool_dir;chmod +x build.sh;./build.sh"
cd $sdk_tool_dir;chmod +x build.sh;./build.sh

result=results.csv

if [ ! -d $output_dir ]; then
    mkdir -p $output_dir
fi
gen_c_common() {
    platform=$1
    info=${2}
    cfile=$3
    cd $sdk_tool_dir;
    if [ -f $result ]
    then
        rm -rf $result
    fi  
    ./sdk_results_parse $SDK_RESULTS/$platform/$version 0
    chmod +x ${sdk_tool_dir}/${result}
    rm -rf $mrc_perf_dir/${result}
    cp ${sdk_tool_dir}/${result} $mrc_perf_dir/
    cd $mrc_perf_dir 
    echo "-------./perf_report sdk 1 ${result} \"${info}\" $cfile"
    ./perf_report sdk 1 ${result} "\"$info\"" $cfile
    # ./perf_report sdk 1 ${result} "CLXSP Sdk" $cfile
    rm -rf $output_dir/${cfile}.c
    mv ${cfile}.c $output_dir/
    echo "-------------mv $cfile.c $output_dir/"
}

gen_c_common "cslsp" "CLXSP Sdk" "ref_clxsp_sdk"
gen_c_common "iclsp" "ICXSP Sdk" "ref_icxsp_sdk"
gen_c_common "icld" "ICXD Sdk" "ref_icxd_sdk"
