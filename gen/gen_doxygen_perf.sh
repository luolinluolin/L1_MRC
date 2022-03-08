#!/bin/bash

mkdir -p src_perf/

cp -rf doxygen_perf_src/* src_perf/

doxygen doxyfile-perf-1.8.17

if [ ! -d ./docs_perf ]
then
    mkdir -p docs_perf/html
fi
cp -rf ../utils/* docs_perf/html/

tar -zcvf perf.tar.gz docs_perf/html/
#clean up

rm -rf src_perf
