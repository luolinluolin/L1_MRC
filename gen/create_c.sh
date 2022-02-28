#!/bin/bash
	
work_path=$PWD
target=$work_path/Rel_test
test_mode=$1

rm -rf ./data/*.c
rm -rf ./data/*.tar

cd $target/flexran_l1_sw/misc/tools/mrc_perf_report/linux/;chmod +x build.sh;./build.sh

cd $work_path;cp $work_path/logs/*.txt $work_path/data/

for i in `cd ./data/;ls *.txt`
do
  echo "=== ===== $i"
  cd $target/flexran_l1_sw/misc/tools/mrc_perf_report/linux/;
  ./perf_report pipeline 1 $work_path/data/$i $test_mode $i 

done

mv *.c $work_path/data/
cd $work_path/data/

###############CSL
if [ $test_mode = "CSL_VC" ]
then
  echo "start converse for the $test_mode"
  cd $work_path/data/; rm -rf *.txt
  mv ${test_mode}_on_l1_mlog_stats.txt.c       ref_sub3_cslsp_htoff_mu0_20mhz_4x4_vista_creek.c &>/dev/null
  mv ${test_mode}_off_l1_mlog_stats.txt.c      ref_sub3_cslsp_hton_mu0_20mhz_4x4_vista_creek.c  &>/dev/null
  mv ${test_mode}_on_100_l1_mlog_stats.txt.c   ref_sub6_cslsp_hton_mu1_100mhz_mmimo_32x32_vista_creek.c  &>/dev/null
  mv ${test_mode}_off_100_l1_mlog_stats.txt.c  ref_sub6_cslsp_htoff_mu1_100mhz_mmimo_32x32_vista_creek.c &>/dev/null
  
  mv ${test_model}_on_100_4x4_l1_mlog_stats.c         ref_sub6_cslsp_hton_mu1_100mhz_mmimo_4x4_vista_creek.c  &>/dev/null
  mv ${test_model}_SoftLDPC_off_20_l1_mlog_stats.c    ref_sub6_cslsp_htoff_mu0_20mhz_mmimo_4x4_vista_creek.c  &>/dev/null
  mv ${test_model}_SoftLDPC_on_20_l1_mlog_stats.c     ref_sub6_cslsp_hton_mu0_20mhz_mmimo_4x4_vista_creek.c  &>/dev/null
  mv ${test_model}_SoftLDPC_off_urllc_l1_mlog_stats.c ref_sub6_cslsp_htoff_urllc_htoff_4x4_vista_creek.c  &>/dev/null
  mv ${test_model}_SoftLDPC_on_urllc_l1_mlog_stats.c  ref_sub6_cslsp_hton_urllc_htoff_4x4_vista_creek.c  &>/dev/null

elif [ $test_mode = "CSL_SUB6" ]
then
  echo "start converse for the $test_mode"
  cd $work_path/data/; rm -rf *.txt
  mv ${test_mode}_on*.c    ref_sub6_cslsp_hton_mu1_100mhz_mmimo_32x32_terasic.c  &>/dev/null
  mv ${test_mode}_off*.c   ref_sub6_cslsp_htoff_mu1_100mhz_mmimo_32x32_terasic.c &>/dev/null

###############SKLD
elif [ $test_mode = "SKLD_MM" ]
then
  echo "start converse for the $test_mode"
  cd $work_path/data/; rm -rf *.txt
  mv ${test_mode}_on*.c  ref_mmwave_skld_hton_mu3_100mhz_2x2_terasic.c  &>/dev/null
  mv ${test_mode}_off*.c ref_mmwave_skld_htoff_mu3_100mhz_2x2_terasic.c &>/dev/null

elif [ $test_mode = "SKLD_SUB6" ]
then
  echo "start converse for the $test_mode"
  cd $work_path/data/; rm -rf *.txt
  mv ${test_mode}_on*.c ref_sub6_skld_hton_mu1_100mhz_4x4_terasic.c   &>/dev/null
  mv ${test_mode}_off*.c ref_sub6_skld_htoff_mu1_100mhz_4x4_terasic.c &>/dev/null

###############SKLD_VC
elif [ $test_mode = "SKLD_VC_MM" ]
then
  echo "start converse for the $test_mode"
  cd $work_path/data/; rm -rf *.txt
  mv ${test_mode}_on*.c ref_mmwave_csld_hton_mu3_100mhz_2x2_vista_creek.c   &>/dev/null
  mv ${test_mode}_off*.c ref_mmwave_csld_htoff_mu3_100mhz_2x2_vista_creek.c &>/dev/null

elif [ $test_mode = "SKLD_VC_SUB6" ]
then
  echo "start converse for the $test_mode"
  cd $work_path/data/; rm -rf *.txt
  mv ${test_mode}_on*.c  ref_sub6_skld_hton_mu1_100mhz_4x4_vista_creek.c   &>/dev/null
  mv ${test_mode}_off*.c  ref_sub6_skld_htoff_mu1_100mhz_4x4_vista_creek.c &>/dev/null
###############

else

   echo "done"
fi

cd $work_path; tar cvf  ${test_mode}.tar ./data; ls -ld ./${test_mode}.tar
