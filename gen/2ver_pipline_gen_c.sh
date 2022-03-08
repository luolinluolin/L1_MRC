
if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./2ver_pipline_gen_c.sh prod_r21.11 master
     "
   exit 0
fi
version1=$1
version2=$2

CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source $CUR_DIR/genenv.sh
source $CUR_DIR/../var/timervar.sh

# perf_report=$mrc_perf_dir/perf_report
result_dir=$pipline_results_dir/..
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
    summary=$6

    echo "cases_inf: ${cases_inf}"
    echo "cfiles_name: ${cfiles_name}"
    num=0
    for case in $cases
    do
        echo "-----------pipline $platform, $version1 $version2 $case-------------"
        echo "-----------cases_inf ${cases_inf}-------------"
        echo "-----------cfiles_name ${cfiles_name[$num]}-------------"

        # cases_inf=`echo ${cases_inf}|awk -F "\" \"" '{print $num}'|sed "s/\"//g"`
        case_inf=${cases_inf[$num]}
        echo "------num $num-----case_inf ${case_inf}-------------"
        
        rm -rf $mrc_perf_dir/${case}_$version1.txt
        rm -rf $mrc_perf_dir/${case}_$version2.txt
        cd $mrc_perf_dir
        cp $input_dir/$version1/${case}.txt ./${case}_$version1.txt
        cp $input_dir/$version2/${case}.txt ./${case}_$version2.txt

        output_cfile_name=${cfiles_name[${num}]}_${repo_version1}_vs_${repo_version2}
        rm -rf ${output_cfile_name}.c
        string1=${case_inf}_${repo_version1}
        string2=${case_inf}_${repo_version2}

        echo "./perf_report ${type} 2 ./${case}_$version1.txt $string1 ./${case}_$version2.txt $string2 ${output_cfile_name}"
        ./perf_report ${type} 2 ./${case}_$version1.txt $string1 ./${case}_$version2.txt $string2 ${output_cfile_name} $summary
        
        rm -rf ${output_dir}/${output_cfile_name}.c
        mv ${output_cfile_name}.c ${output_dir}
        echo "mv ${cfiles_name[${num}]}.c ${output_dir}"
        num=$(( $num + 1 ))
        # $perf_report ${type} 1 $input_dir/${case}.txt ${case_inf} ${output_dir}/${cfiles_name[${num}]}
    done
}

summary_pre_proc() {
    summary_file=$1

    cd $mrc_perf_dir
    rm -rf ${summary_file}.c
}
summary_post_proc() {
    summary_file=$1
    echo "**/" >> $summary_file.c
    rm -rf ${output_dir}/${summary_file}.c
    mv ${summary_file}.c ${output_dir}
}

summary_pre_proc $cslsp_q2q_summary
gen_c_common  ${result_dir}/timer/cslsp "${timer_cslsp_case}" "${timer_cslsp_info}" "${timer_cslsp_cfile}" pipeline $cslsp_q2q_summary
summary_post_proc $cslsp_q2q_summary

summary_pre_proc $iclsp_q2q_summary
gen_c_common  ${result_dir}/timer/iclsp "${timer_iclsp_case}" "${timer_iclsp_info}" "${timer_iclsp_cfile}" pipeline $iclsp_q2q_summary
summary_post_proc $iclsp_q2q_summary

summary_pre_proc $icld_q2q_summary
gen_c_common  ${result_dir}/timer/icld "${timer_icld_case}" "${timer_icld_info}" "${timer_icld_cfile}" pipeline
summary_post_proc $icld_q2q_summary


summary_pre_proc $oran_q2q_summary
gen_c_common  ${result_dir}/oran/cslsp "${oran_cslsp_case}" "${oran_cslsp_info}" "${oran_cslsp_cfile}" pipeline $oran_q2q_summary
gen_c_common  ${result_dir}/oran/iclsp "${oran_iclsp_case}" "${oran_iclsp_info}" "${oran_iclsp_cfile}" pipeline $oran_q2q_summary
summary_post_proc $oran_q2q_summary
