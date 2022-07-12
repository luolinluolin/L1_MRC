#!/bin/bash

kill -9 $(ps -ef |grep -E 'testmac|l1app|sample-app*|expect'  |awk '{print$2}')
# screen -ls|awk 'NR>=2'|awk '{print "screen -S "$1" -X quit"}'|sh
# screen -wipe