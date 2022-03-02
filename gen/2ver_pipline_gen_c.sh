
if [ $# -ne 1 ] || [ $1 = "-h" ];then
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
    cases_inf=$3
    cfiles_name=($4)
    type=$5

    echo "cases_inf: ${cases_inf}"
    echo "cfiles_name: ${cfiles_name}"
    num=0
    for case in $cases
    do
        echo "-----------pipline $platform, $version1 $version2 $case-------------"
        echo "-----------cases_inf ${cases_inf}-------------"
        echo "-----------cfiles_name ${cfiles_name[$num]}-------------"
        # cases_inf=`echo ${cases_inf}|awk -F "\" \"" '{print $num}'|sed "s/\"//g"`
        case_inf=`echo ${cases_inf}|cut -d \| -f $num|sed "s/\(\" \"\|\"\)//"`
        case_inf=\"$case_inf\"
        echo "------num $num-----case_inf ${case_inf}-------------"
        
        rm -rf $mrc_perf_dir/${case}_$version1.txt
        rm -rf $mrc_perf_dir/${case}_$version2.txt
        cd $mrc_perf_dir
        cp $input_dir/$version1/${case}.txt ./${case}_$version1.txt
        cp $input_dir/$version2/${case}.txt ./${case}_$version2.txt
        echo "./perf_report ${type} 1 ${case}.txt "\"${case_inf}\"" ${cfiles_name[${num}]}"
        ./perf_report ${type} 2 ${case}_$version1.txt ./${case}_$version2.txt "\"${case_inf}${html_name_diff}\"" ${cfiles_name[${num}]}${cfile_name_diff}
        mv ${cfiles_name[${num}]}.c ${output_dir}
        echo "mv ${cfiles_name[${num}]}.c ${output_dir}"
        num=$(( $num + 1 ))
        # $perf_report ${type} 1 $input_dir/${case}.txt ${case_inf} ${output_dir}/${cfiles_name[${num}]}
    done
}

sleep 10
gen_c_common  ${result_dir}/timer/cslsp "${timer_cslsp_case}" "${timer_cslsp_info}" "${timer_cslsp_cfile}" pipeline
gen_c_common  ${result_dir}/timer/iclsp "${timer_iclsp_case}" "${timer_iclsp_info}" "${timer_iclsp_cfile}" pipeline
gen_c_common  ${result_dir}/timer/icld "${timer_iclsp_case}" "${timer_iclsp_info}" "${timer_icld_cfile}" pipeline

gen_c_common  ${result_dir}/oran/cslsp "${oran_cslsp_case}" "${oran_cslsp_info}" "${oran_cslsp_cfile}" pipeline
gen_c_common  ${result_dir}/oran/iclsp "${oran_iclsp_case}" "${oran_iclsp_info}" "${oran_iclsp_cfile}" pipeline
