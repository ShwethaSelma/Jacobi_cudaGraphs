#!/bin/bash 
source /opt/intel/oneapi/setvars.sh

#Advisor Roofline script

bin="jmcuda gpumethod=1"
prj_dir="./roofline_data0"

echo $bin
rm -r ${prj_dir}
advisor --collect=survey --project-dir=${prj_dir} --profile-gpu -- ./${bin} -q
advisor --collect=tripcounts --project-dir=${prj_dir} --flop --profile-gpu -- ./${bin} -q
advisor --report=roofline --gpu --project-dir=${prj_dir} --report-output=./roofline_gpu_${bin}.html -q
