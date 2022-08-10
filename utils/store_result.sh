log_dir=$1
src_dir=$2
dst_dir=$3


if [ ! -d $dst_dir ]; then
    mkdir -p $dst_dir
else
    rm -rf $dst_dir/*
fi

echo "------------cp $src_dir/l1_mlog_stats.txt to --------------" 
echo "------------$dst_dir --------------" 
/usr/bin/mv -f $src_dir/l1mlog* ${dst_dir}
/usr/bin/mv -f $src_dir/l1_mlog_stats.txt ${dst_dir}
/usr/bin/mv -f $src_dir/PhyStats* ${dst_dir}

echo "------------cp $log_dir/l1_5g.log to --------------" 
echo "------------$dst_dir --------------" 
mv $log_dir/l1_5g.log ${dst_dir}/l1_log.txt
mv $log_dir/l2_5g.log ${dst_dir}/l2_log.txt
