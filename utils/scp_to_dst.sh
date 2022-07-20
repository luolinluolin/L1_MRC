
dst_ip_folder=$1
folder=$2

if [ -n "$dst_ip_folder" ]; then
    echo "---------result scp -r $folder $dst_ip_folder---------"
    scp -r $folder $dst_ip_folder
else
    echo "---------result store in local---------"
fi