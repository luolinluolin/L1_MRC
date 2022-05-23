#!/bin/bash

mkdir -p src_perf/

cp -rf doxygen_perf_src/* src_perf/

doxygen doxyfile-perf-1.8.17

if [ ! -d ./docs_perf ]
then
    mkdir -p docs_perf/html
fi
cp -rf ../utils/* docs_perf/html/
cp ../utils/tables_block_diagrams_formulas.css docs_perf/perf_report/
cp ../utils/release_history.css docs_perf/perf_report/
cp ../utils/intel-logo.png docs_perf/perf_report/

tar -zcvf perf.tar.gz docs_perf/perf_report/
#clean up

rm -rf src_perf
