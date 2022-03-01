#!/bin/bash
CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

JQ=$CUR_DIR/../tool/jq
cfgfile=$CUR_DIR/test_case.json

html_name_diff=`cat $cfgfile |$JQ '.[0]|.html_name_diff'`
cfile_name_diff=`cat $cfgfile |$JQ '.[0]|.cfile_name_diff'`

#parse test case
timer_csl_sp_case=`(cat $cfgfile |$JQ '.[0]|.timer_csl_sp_info|.[]|.case' |sed 's/\"//g')`
timer_csl_sp_info=`(cat $cfgfile |$JQ '.[0]|.timer_csl_sp_info|.[]|.info')`
timer_csl_sp_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_csl_sp_info|.[]|.cfile')`

timer_icl_sp_case=`(cat $cfgfile |$JQ '.[0]|.timer_icl_sp_info|.[]|.case' |sed 's/\"//g')`
timer_icl_sp_info=`(cat $cfgfile |$JQ '.[0]|.timer_icl_sp_info|.[]|.info')`
timer_icl_sp_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_icl_sp_info|.[]|.cfile')`

timer_icl_d_case=`(cat $cfgfile |$JQ '.[0]|.timer_icl_d_info|.[]|.case' |sed 's/\"//g')`
timer_icl_d_info=`(cat $cfgfile |$JQ '.[0]|.timer_icl_d_info|.[]|.info')`
timer_icl_d_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_icl_d_info|.[]|.cfile')`

oran_csl_sp_case=`(cat $cfgfile |$JQ '.[0]|.oran_csl_sp_info|.[]|.case' |sed 's/\"//g')`
oran_csl_sp_info=`(cat $cfgfile |$JQ '.[0]|.oran_csl_sp_info|.[]|.info')`
oran_csl_sp_cfile=`(cat $cfgfile |$JQ '.[0]|.oran_csl_sp_info|.[]|.cfile')`

oran_icl_sp_case=`(cat $cfgfile |$JQ '.[0]|.oran_icl_sp_info|.[]|.case' |sed 's/\"//g')`
oran_icl_sp_info=`(cat $cfgfile |$JQ '.[0]|.oran_icl_sp_info|.[]|.info')`
oran_icl_sp_cfile=`(cat $cfgfile |$JQ '.[0]|.oran_icl_sp_info|.[]|.cfile')`