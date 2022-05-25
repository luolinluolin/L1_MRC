
if [ $# -ne 4 ] || [ $1 = "-h" ];then
    echo "
         example : ./rct_gen_2v.sh iclsp prod_r22.03 spree master
     "
   exit 0
fi
platform1=$1
version1=$2
platform2=$3
version2=$4

CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source $CUR_DIR/genenv.sh
source $CUR_DIR/../var/timervar.sh

# perf_report=$mrc_perf_dir/perf_report
result_dir=$RESULT_DIR
output_dir=$CFILE_RESULTS

cd $mrc_perf_dir;chmod +x build.sh;./build.sh
cd $sdk_tool_dir;chmod +x build.sh;./build.sh

if [ ! -d $output_dir ]; then
    mkdir -p $output_dir
fi
gen_c_common() {
    input_dir=$1
    cases=($2)
    cases_inf=($3)
    cfiles_name=($4)
    type=$5

    echo "cases: ${cases}"
    echo "cases_inf: ${cases_inf}"
    echo "cfiles_name: ${cfiles_name}"
    
    spreenum=0
    cslspnum=1
    # spree_case=${cases[${spreenum}]}
    # cslsp_case=${cases[${cslspnum}]}
    spree_case=$platform1
    cslsp_case=$platform2

    case_inf=${cases_inf[${spreenum}]}

    # echo "-----------cases_inf ${cases_inf[$spreenum]}-------------"

    echo "test diff case: $spree_case ${platform2}"


    cd $mrc_perf_dir
    rm -rf $version1.txt $version2.txt
    echo "cp $input_dir/$platform1/$version1/rctresult.txt ./$version1.txt"
    cp $input_dir/$platform1/$version1/rctresult.txt ./$version1.txt
    cp $input_dir/$platform2/$version2/rctresult.txt ./$version2.txt

    
    output_cfile_name=${cfiles_name[${spreenum}]}
    cfile=${output_cfile_name}.c
    rm -rf ${cfile}
    string1=${case_inf}_${platform1}
    string2=${case_inf}_${platform2}

    echo "./perf_report ${type} 2 ./$version1.txt $string1 ./$version2.txt $string2 ${output_cfile_name}"
    ./perf_report ${type} 2 ./$version1.txt $string1 ./$version2.txt $string2 ${output_cfile_name}

    rm -rf ${output_dir}/${cfile}
    mv ${cfile} ${output_dir}
    echo "mv ${cfile} ${output_dir}"
}

gen_c_common  ${result_dir}/rct  "${rct_pusch_diff_case}" "${rct_pusch_diff_info}" "${rct_pusch_diff_cfile}" wireless_pusch
# gen_c_common  ${result_dir}/rct "${rct_pusch_case}" "${rct_pucch_info}" "${rct_pucch_cfile}" wireless_pucch
# gen_c_common  ${result_dir}/rct "${rct_prach_case}" "${rct_prach_info}" "${rct_prach_cfile}" wireless_prach