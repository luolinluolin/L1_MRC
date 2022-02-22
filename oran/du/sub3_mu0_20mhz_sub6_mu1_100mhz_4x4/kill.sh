#!/bin/bash

kill -9 $(ps -ef |grep -E 'testmac|l1app|l1.ex|expect'  |awk '{print$2}')
