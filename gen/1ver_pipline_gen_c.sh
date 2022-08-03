
if [ $# -ne 1 ] || [ $1 = "-h" ];then
    echo "
         example : ./1ver_pipline_gen_c.sh prod_r21.11
     "
   exit 0
fi
version=$1
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

    echo "cases_inf: ${cases_inf}"
    echo "cfiles_name: ${cfiles_name}"
    num=0
    for case in $cases
    do
        echo "-----------pipline $platform, $version $case-------------"
        echo "-----------cases_inf ${cases_inf[$num]}-------------"
        echo "-----------cfiles_name ${cfiles_name[$num]}-------------"
        # cases_inf=`echo ${cases_inf}|awk -F "\" \"" '{print $num}'|sed "s/\"//g"`
        # case_inf=`echo ${cases_inf}|cut -d \| -f $num|sed "s/\(\" \"\|\"\)//"`
        # case_inf=\"$case_inf\"
        case_inf=${cases_inf[$num]}
        echo "------num $num-----case_inf ${case_inf}-------------"

        cfile=${cfiles_name[${num}]}.c
        mlog=${mrc_perf_dir}/l1_mlog_stats.txt
        rm -rf $cfile
        rm -rf ${mlog}
        cd $mrc_perf_dir
        echo "cp $input_dir/${case}/l1_mlog_stats.txt ./"
        cp $input_dir/${case}/l1_mlog_stats.txt ./
        echo "./perf_report ${type} 1 ${case}.txt "\"${case_inf}\"" ${cfiles_name[${num}]}"
        ./perf_report ${type} 1 l1_mlog_stats.txt ${case_inf} ${cfiles_name[${num}]}

        rm -rf ${output_dir}/${cfile}
        mv ${cfile} ${output_dir}
        echo "mv ${cfile} ${output_dir}"
        num=$(( $num + 1 ))
        # $perf_report ${type} 1 $input_dir/${case}.txt ${case_inf} ${output_dir}/${cfiles_name[${num}]}
    done
}

gen_c_common  ${result_dir}/timer/cslsp/$version "${timer_cslsp_case}" "${timer_cslsp_info}" "${timer_cslsp_cfile}" pipeline
gen_c_common  ${result_dir}/timer/iclsp/$version "${timer_iclsp_case}" "${timer_iclsp_info}" "${timer_iclsp_cfile}" pipeline
gen_c_common  ${result_dir}/timer/icld/$version "${timer_icld_case}" "${timer_icld_info}" "${timer_icld_cfile}" pipeline

gen_c_common  ${result_dir}/oran/cslsp/$version "${oran_cslsp_case}" "${oran_cslsp_info}" "${oran_cslsp_cfile}" pipeline
gen_c_common  ${result_dir}/oran/iclsp/$version "${oran_iclsp_case}" "${oran_iclsp_info}" "${oran_iclsp_cfile}" pipeline
