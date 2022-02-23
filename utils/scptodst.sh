
ip=$1
folder=$2

if [ -n "$iq" ]; then
    echo "---------result scp -r $folder root@$ip:$folder---------"
    scp -r $folder root@$ip:$folder
else
    echo "---------result store in local---------"
fi