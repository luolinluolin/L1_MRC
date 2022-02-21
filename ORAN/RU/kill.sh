#!/bin/bash

kill -9 $(ps -ef |grep -E 'testmac|l1app|sample-app|expect'  |awk '{print$2}')
