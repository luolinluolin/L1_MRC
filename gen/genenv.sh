MRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)/..
export path=$path:/opt/utils/doxygen-1.8.12/bin

source $MRC_DIR/var/var.sh

SDK_RESULTS=$sdk_results_dir
CFILE_RESULTS=$RESULT_DIR/perfc

env_file=$MRC_DIR/var/env.sh
source $env_file

source $MRC_DIR/var/test_case.sh

mrc_perf_dir=$FLEXRAN_L1_SW/misc/tools/mrc_perf_report/linux
sdk_tool_dir=$FLEXRAN_L1_SW/misc/tools/sdk_results_parse/linux
