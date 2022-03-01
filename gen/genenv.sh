MRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)/..
export path= $path:/opt/utils/doxygen-1.8.12/bin

source $MRC_DIR/var/oranvar.sh
export ORAN_PIPLINE_RESULT=$pipline_results_dir

source $MRC_DIR/var/timervar.sh
export TIMER_PIPLINE_RESULT=$pipline_results_dir

export SDK_RESULTS=$sdk_results_dir

export CFILE_RESULTS=$TIMER_PIPLINE_RESULT/../perfc/

env_file=$MRC_DIR/var/env.sh
source $env_file

source $MRC_DIR/var/test_case.sh

export mrc_perf_dir=$FLEXRAN_L1_SW/misc/tools/mrc_perf_report/linux
export sdk_tool_dir=$FLEXRAN_L1_SW/misc/tools/sdk_results_parse/linux/