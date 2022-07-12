######################################################################
#
# <COPYRIGHT_TAG>
#
#######################################################################
#!/bin/bash
base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source ${base}/oranenv.sh

#export PTP_DIR=/root/linuxptp
# source ../oranenv.sh
echo "-----------$RU_PTP_PORT"
echo "-----------$PTP_DIR"

if [ -z "$PTP_DIR" ]
then
    echo "## ERROR: Please make sure environment variable PTP_DIR is set to valid PTP path."
    echo "       To fix, please do: export PTP_DIR=path_to_ptp_folder    before running this script"
    exit 1
fi

#netInterface=enp175s0f0
#netInterface=eno1

usage() {
    echo "Usage: ptp.sh server_type"
    echo "       server_type: master / slave"
    exit
}

if [ $# -lt 2 ]
then
    usage
    exit
fi


if [ "$1" == "master" ]
then
    # MASTER
    # PTP4L
    netInterface=$DU_PTP_PORT
    echo "$PTP_DIR/ptp4l -i $netInterface -2 -f $PTP_DIR/configs/default.cfg -m"
    screen -d -m bash -c "$PTP_DIR/ptp4l -i $netInterface -2 -f $PTP_DIR/configs/default.cfg -m"
    # PHC2SYS
    echo "$PTP_DIR/phc2sys -s $netInterface -O 0 -m"
    # screen -d -m bash -c "$PTP_DIR/phc2sys -s CLOCK_REALTIME -c $netInterface -O 0 -m"
    screen -d -m bash -c "$PTP_DIR/phc2sys -s $netInterface -O 0 -m"
else
    # SLAVE
    # PTP4L
    netInterface=$RU_PTP_PORT
    screen -d -m bash -c "$PTP_DIR/ptp4l -i $netInterface -2 -f $PTP_DIR/configs/default.cfg -s -m"
    # PHC2SYS
    screen -d -m bash -c "$PTP_DIR/phc2sys -s $netInterface -R 8 -O 0 -m"
fi
