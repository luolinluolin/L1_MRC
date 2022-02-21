ps -aux|grep l1app|awk '{print $2}'|xargs kill -9
ps -aux|grep testmac|awk '{print $2}'|xargs kill -9

