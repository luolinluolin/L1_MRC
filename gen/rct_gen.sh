
if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./rct_gen.sh prod_r21.11 ldpc_option(software_ldpc|hardware_ldpc)
     "
   exit 0
fi
version=$1
ldpc_option=$2
CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source $CUR_DIR/genenv.sh
source $CUR_DIR/../var/var.sh

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
    cases=$2
    cases_inf=($3)
    cfiles_name=($4)
    type=$5
    version=$6

    echo "cases_inf: ${cases_inf}"
    echo "cfiles_name: ${cfiles_name}"
    echo "version: " $version
    num=0
    for case in $cases
    do
        echo "-----------rct $platform, $version $case-------------"
        echo "-----------cases_inf ${cases_inf[$num]}-------------"
        echo "-----------cfiles_name ${cfiles_name[$num]}-------------"
        # cases_inf=`echo ${cases_inf}|awk -F "\" \"" '{print $num}'|sed "s/\"//g"`
        # case_inf=`echo ${cases_inf}|cut -d \| -f $num|sed "s/\(\" \"\|\"\)//"`
        # case_inf=\"$case_inf\"
        case_inf=${cases_inf[$num]}
        echo "------num $num-----case_inf ${case_inf}-------------"

        test_result=${ldpc_option}/rctresult.txt
        cfile=${cfiles_name[${num}]}.c
        mlog=${mrc_perf_dir}/rctresult.txt
        rm -rf $cfile
        rm -rf ${mlog}
        cd $mrc_perf_dir
        echo "cp $input_dir/${case}/${version}/${test_result} ./"
        cp $input_dir/${case}/${version}/${test_result} ./
        echo "./perf_report ${type} 1 rctresult.txt "\"${case_inf}\"" ${cfiles_name[${num}]}"
        ./perf_report ${type} 1  rctresult.txt ${case_inf} ${cfiles_name[${num}]}

        rm -rf ${output_dir}/${cfile}
        mv ${cfile} ${output_dir}
        echo "mv ${cfile} ${output_dir}"
        num=$(( $num + 1 ))
        # $perf_report ${type} 1 $input_dir/${case}.txt ${case_inf} ${output_dir}/${cfiles_name[${num}]}
    done
}


gen_c_common  ${result_dir}/rct "${rct_pusch_case}" "${rct_pusch_info}" "${rct_pusch_cfile}" wireless_pusch $version
gen_c_common  ${result_dir}/rct "${rct_pucch_case}" "${rct_pucch_info}" "${rct_pucch_cfile}" wireless_pucch $version
gen_c_common  ${result_dir}/rct "${rct_prach_case}" "${rct_prach_info}" "${rct_prach_cfile}" wireless_prach $version
