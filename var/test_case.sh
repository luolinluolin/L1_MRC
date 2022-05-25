#!/bin/bash
CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

JQ=$CUR_DIR/../tool/jq
cfgfile=$CUR_DIR/test_case.json

repo_version1=`cat $cfgfile |$JQ '.[0]|.version1' |sed 's/\"//g'`
repo_version2=`cat $cfgfile |$JQ '.[0]|.version2' |sed 's/\"//g'`


cslsp_q2q_summary=`cat $cfgfile |$JQ '.[0]|.cslsp_q2q_summary' |sed 's/\"//g'`
iclsp_q2q_summary=`cat $cfgfile |$JQ '.[0]|.iclsp_q2q_summary' |sed 's/\"//g'`
icld_q2q_summary=`cat $cfgfile |$JQ '.[0]|.icld_q2q_summary' |sed 's/\"//g'`
oran_q2q_summary=`cat $cfgfile |$JQ '.[0]|.oran_q2q_summary' |sed 's/\"//g'`

#parse test case
timer_cslsp_case=`(cat $cfgfile |$JQ '.[0]|.timer_cslsp_info|.[]|.case' |sed 's/\"//g')`
timer_cslsp_info=`(cat $cfgfile |$JQ '.[0]|.timer_cslsp_info|.[]|.info' |sed 's/\"//g')`
timer_cslsp_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_cslsp_info|.[]|.cfile' |sed 's/\"//g')`

timer_iclsp_case=`(cat $cfgfile |$JQ '.[0]|.timer_iclsp_info|.[]|.case' |sed 's/\"//g')`
timer_iclsp_info=`(cat $cfgfile |$JQ '.[0]|.timer_iclsp_info|.[]|.info' |sed 's/\"//g')`
timer_iclsp_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_iclsp_info|.[]|.cfile' |sed 's/\"//g')`

timer_icld_case=`(cat $cfgfile |$JQ '.[0]|.timer_icld_info|.[]|.case' |sed 's/\"//g')`
timer_icld_info=`(cat $cfgfile |$JQ '.[0]|.timer_icld_info|.[]|.info' |sed 's/\"//g')`
timer_icld_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_icld_info|.[]|.cfile' |sed 's/\"//g')`

oran_cslsp_case=`(cat $cfgfile |$JQ '.[0]|.oran_cslsp_info|.[]|.case' |sed 's/\"//g')`
oran_cslsp_info=`(cat $cfgfile |$JQ '.[0]|.oran_cslsp_info|.[]|.info' |sed 's/\"//g')`
oran_cslsp_cfile=`(cat $cfgfile |$JQ '.[0]|.oran_cslsp_info|.[]|.cfile' |sed 's/\"//g')`

oran_iclsp_case=`(cat $cfgfile |$JQ '.[0]|.oran_iclsp_info|.[]|.case' |sed 's/\"//g')`
oran_iclsp_info=`(cat $cfgfile |$JQ '.[0]|.oran_iclsp_info|.[]|.info' |sed 's/\"//g')`
oran_iclsp_cfile=`(cat $cfgfile |$JQ '.[0]|.oran_iclsp_info|.[]|.cfile' |sed 's/\"//g')`

rct_platform1=`cat $cfgfile |$JQ '.[0]|.rct_platform1' |sed 's/\"//g'`
rct_platform2=`cat $cfgfile |$JQ '.[0]|.rct_platform2' |sed 's/\"//g'`
rct_pusch_diff_case=`(cat $cfgfile |$JQ '.[0]|.rct_pusch_diff_info|.[]|.case' |sed 's/\"//g')`
rct_pusch_diff_info=`(cat $cfgfile |$JQ '.[0]|.rct_pusch_diff_info|.[]|.info' |sed 's/\"//g')`
rct_pusch_diff_cfile=`(cat $cfgfile |$JQ '.[0]|.rct_pusch_diff_info|.[]|.cfile' |sed 's/\"//g')`

rct_pusch_case=`(cat $cfgfile |$JQ '.[0]|.rct_pusch_info|.[]|.case' |sed 's/\"//g')`
rct_pusch_info=`(cat $cfgfile |$JQ '.[0]|.rct_pusch_info|.[]|.info' |sed 's/\"//g')`
rct_pusch_cfile=`(cat $cfgfile |$JQ '.[0]|.rct_pusch_info|.[]|.cfile' |sed 's/\"//g')`

rct_pucch_case=`(cat $cfgfile |$JQ '.[0]|.rct_pucch_info|.[]|.case' |sed 's/\"//g')`
rct_pucch_info=`(cat $cfgfile |$JQ '.[0]|.rct_pucch_info|.[]|.info' |sed 's/\"//g')`
rct_pucch_cfile=`(cat $cfgfile |$JQ '.[0]|.rct_pucch_info|.[]|.cfile' |sed 's/\"//g')`

rct_prach_case=`(cat $cfgfile |$JQ '.[0]|.rct_prach_info|.[]|.case' |sed 's/\"//g')`
rct_prach_info=`(cat $cfgfile |$JQ '.[0]|.rct_prach_info|.[]|.info' |sed 's/\"//g')`
rct_prach_cfile=`(cat $cfgfile |$JQ '.[0]|.rct_prach_info|.[]|.cfile' |sed 's/\"//g')`