#######################################################################
#
# <COPYRIGHT_TAG>
#
#######################################################################
#!/bin/bash

#export PTP_DIR=/root/linuxptp
source ../oranenv.sh
# source ../../var/oranvar.sh

if [ -z "$PTP_DIR" ]
then
    echo "## ERROR: Please make sure environment variable PTP_DIR is set to valid PTP path."
    echo "       To fix, please do: export PTP_DIR=path_to_ptp_folder    before running this script"
    exit 1
fi

serverType=
ptpType=
netInterface=$RU_PTP_PORT
#netInterface=enp24s0f0
#netInterface=eno2

usage() {
    echo "Usage: ptp.sh server_type ptp_type"
    echo "       server_type: master / client"
    echo "       ptp_type: ptp4l / phc2sys"
    exit
}

if [ $# -lt 2 ]
then
    usage
    exit
fi

# Check server_type
if [ "$1" == "master" ]
then
    serverType=0
elif [ "$1" == "client" ]
then
    serverType=1
else
    usage
    exit
fi

# Check ptp_type
if [ "$2" == "ptp4l" ]
then
    ptpType=0
elif [ "$2" == "phc2sys" ]
then
    ptpType=1
else
    usage
    exit
fi

if [ $serverType -eq 0 ]
then
    # MASTER
    if [ $ptpType -eq 0 ]
    then
        # PTP4L
        $PTP_DIR/ptp4l -i $netInterface -2 -f $PTP_DIR/configs/default.cfg -m
    else
        # PHC2SYS
        $PTP_DIR/phc2sys -s CLOCK_REALTIME -c $netInterface -O 0 -m
    fi
else
    # SLAVE
    if [ $ptpType -eq 0 ]
    then
        # PTP4L
        $PTP_DIR/ptp4l -i $netInterface -2 -f $PTP_DIR/configs/default.cfg -s -m
    else
        # PHC2SYS
        $PTP_DIR/phc2sys -s $netInterface -R 8 -O 0 -m
    fi
fi
