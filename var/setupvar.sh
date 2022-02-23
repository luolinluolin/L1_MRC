
MRC_VAR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$MRC_VAR_DIR/mrc.conf

echo'-----------setup.conf------------------'
ORANISA=`sed '/^isa=/!d;s/.*=//' $cfg_file`
WORK_DIR=`sed '/^work_dir=/!d;s/.*=//' $cfg_file`

