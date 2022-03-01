#!/bin/bash
CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

JQ=$CUR_DIR/../tool/jq
cfgfile=$CUR_DIR/test_case.json

html_name_diff=`cat $cfgfile |$JQ '.[0]|.html_name_diff'`
cfile_name_diff=`cat $cfgfile |$JQ '.[0]|.cfile_name_diff'`

#parse test case
timer_cslsp_case=`(cat $cfgfile |$JQ '.[0]|.timer_cslsp_info|.[]|.case' |sed 's/\"//g')`
timer_cslsp_info=`(cat $cfgfile |$JQ '.[0]|.timer_cslsp_info|.[]|.info')`
timer_cslsp_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_cslsp_info|.[]|.cfile')`

timer_iclsp_case=`(cat $cfgfile |$JQ '.[0]|.timer_iclsp_info|.[]|.case' |sed 's/\"//g')`
timer_iclsp_info=`(cat $cfgfile |$JQ '.[0]|.timer_iclsp_info|.[]|.info')`
timer_iclsp_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_iclsp_info|.[]|.cfile')`

timer_icld_case=`(cat $cfgfile |$JQ '.[0]|.timer_icld_info|.[]|.case' |sed 's/\"//g')`
timer_icld_info=`(cat $cfgfile |$JQ '.[0]|.timer_icld_info|.[]|.info')`
timer_icld_cfile=`(cat $cfgfile |$JQ '.[0]|.timer_icld_info|.[]|.cfile')`

oran_cslsp_case=`(cat $cfgfile |$JQ '.[0]|.oran_cslsp_info|.[]|.case' |sed 's/\"//g')`
oran_cslsp_info=`(cat $cfgfile |$JQ '.[0]|.oran_cslsp_info|.[]|.info')`
oran_cslsp_cfile=`(cat $cfgfile |$JQ '.[0]|.oran_cslsp_info|.[]|.cfile')`

oran_iclsp_case=`(cat $cfgfile |$JQ '.[0]|.oran_iclsp_info|.[]|.case' |sed 's/\"//g')`
oran_iclsp_info=`(cat $cfgfile |$JQ '.[0]|.oran_iclsp_info|.[]|.info')`
oran_iclsp_cfile=`(cat $cfgfile |$JQ '.[0]|.oran_iclsp_info|.[]|.cfile')`