#!/bin/bash 
source /opt/intel/oneapi/setvars.sh

#Vtune GPU Hotspot script

bin="jmnocg"
prj_dir="vtune_data1"

echo $bin
rm -r ${prj_dir}
echo "Vtune Collect hotspots"
vtune -collect gpu-hotspots -result-dir ${prj_dir} $(pwd)/${bin}

echo "Vtune Summary Report"
vtune -report summary -result-dir ${prj_dir} -format html -report-output $(pwd)/vtune_${bin}.html
