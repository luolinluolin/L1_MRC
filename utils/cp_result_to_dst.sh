
if [ $# -ne 3 ] || [ $1 = "-h" ];then
    echo "
         example : ./cp_result_to_dst.sh  prod_r22.11 result_dir(/home/result) dst_dir(/home/dest)
         ./utils/cp_result_to_dst.sh prod_r22.11 ./result_centos ../release/centos
         ./utils/cp_result_to_dst.sh prod_r22.11 ./result../release/ubuntu
     "
     exit
fi
ver=$1
result_dir=$2
dest_dir=$3

cp_result() {
    mode=$1
    ver=$2
    plat=$3

    dest_dir_local=${dest_dir}/${ver}/${mode}/${plat}
    if [ ! -d $dest_dir_local ]; then
        mkdir -p $dest_dir_local
    fi 

    echo "cp -rf ${result_dir}/${mode}/${plat}/${ver}/* ${dest_dir_local}"
    cp -rf ${result_dir}/${mode}/${plat}/${ver}/* ${dest_dir_local}
}

cp_result_plat() {
    plat=$1
    cp_result timer ${ver} ${plat}
    cp_result sdk_results ${ver} ${plat}
    cp_result rct ${ver} ${plat}
}

cp_result_plat iclsp
cp_result_plat cslsp
cp_result_plat icld
cp_result_plat spreec
