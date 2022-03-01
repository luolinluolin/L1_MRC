
if [ $# -ne 1 ] || [ $1 = "-h" ];then
    echo "
         example : ./genc_pipline_ver.sh  prod_r21.11 master
     "
   exit 0
fi
version1=$1
version2=$2

CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source $CUR_DIR/genenv.sh
source $CUR_DIR/../var/timervar.sh

html_name=$html_name_diff
cfile_name=$cfile_name_diff

perf_report=$mrc_perf_dir/perf_report
TEST_RESULT=$pipline_results_dir/../
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
    cfiles_name=$4
    type=$5

    num=0
    for case in $cases
    do
        echo "-----------pipline $platform, $ver $case-------------"
        echo "-----------cases_inf ${cases_inf[$num]}-------------"
        echo "-----------cfiles_name ${cfiles_name[$num]}-------------"

        $perf_report ${type} 2 $input_dir/${version1}/$case.txt $input_dir/${version2}/$case.txt ${cases_inf[$num]}${html_name} ${output_dir}/${cfiles_name[$num]}${cfile_name}.c
        num=$(( $num + 1 ))
    done
}

gen_c() {
    mode=$1
    platform=$2
    cfg_name=$3
    type=$4
    pipline_result=${TEST_RESULT}/${mode}/$platform/$version
    cases=${${mode}_${cfg_name}_case}
    info=${${mode}_${cfg_name}_info}
    cfile=${${mode}_${cfg_name}_cfile}
    gen_c_common  $pipline_result/$platform/ $cases $info $cfile ${type}
}

gen_c timer cslsp csl_sp pipline
gen_c timer iclsp icl_sp pipline

gen_c oran cslsp csl_sp pipline
gen_c oran iclsp icl_sp pipline