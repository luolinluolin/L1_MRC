cfg=$1
pf=$2

# if [ ! -f cfg ];then
#   echo "pls input right cfg: the file $cfg is not correct"
#   exit 0
# fi
deviceid=`lspci |grep acc |awk '{print $1}'|sed -n '1p'`
deviceid1=`lspci |grep acc |awk '{print $1}'|sed -n '2p'`
deviceid2=`lspci |grep acc |awk '{print $1}'|sed -n '3p'`

################################# change phy config ############################
sed -i "s#<dpdkBasebandFecMode>.*<\/dpdkBasebandFecMode>#<dpdkBasebandFecMode>1<\/dpdkBasebandFecMode>#g"  ${cfg}
if [ $pf = "PF" ]; then
echo "-------------${deviceid}"
sed -i "s#<dpdkBasebandDevice>.*<\/dpdkBasebandDevice>#<dpdkBasebandDevice>0000:${deviceid}<\/dpdkBasebandDevice>#g"  ${cfg}
else
sed -i "s#<dpdkBasebandDevice>.*<\/dpdkBasebandDevice>#<dpdkBasebandDevice>0000:${deviceid1}<\/dpdkBasebandDevice>#g"  ${cfg}
fi

grep  dpdkBasebandDevice $cfg
sed -i 's/<CEInterpMethod>.*<\/CEInterpMethod>/<CEInterpMethod>0<\/CEInterpMethod>/g' ${cfg}
sed -i 's/<PuschLinearInterpEnable>.*<\/PuschLinearInterpEnable>/<PuschLinearInterpEnable>0<\/PuschLinearInterpEnable>/g' ${cfg}
sed -i 's/<PuschLinearInterpGranularityAll>.*<\/PuschLinearInterpGranularityAll>/<PuschLinearInterpGranularityAll>4<\/PuschLinearInterpGranularityAll>/g' ${cfg}

echo " ----------phycfg_timer.xml <PucchF0NoiseEstType>0</PucchF0NoiseEstType> paramter value ------------"
pucchnoise=`grep  'PucchF0NoiseEstType' $cfg`
if [ "$pucchnoise" != "" ]; then
  sed -i 's/<PucchF0NoiseEstType>.*<\/PucchF0NoiseEstType>/<PucchF0NoiseEstType>1<\/PucchF0NoiseEstType>/g' $cfg
  echo " -----------change phycfg_timer.xml PucchF0NoiseEstType  paramter value to test BBDEV model--------------"
else
  sed -i '/<PucchSplit>0<\/PucchSplit>/a\            <PucchF0NoiseEstType>1<\/PucchF0NoiseEstType>' $cfg
fi
grep  PucchF0NoiseEstType $cfg

sed -i 's/<prachThresholdMethod>.*<\/prachThresholdMethod>/<prachThresholdMethod>0<\/prachThresholdMethod>/g' ${cfg}
grep  prachThresholdMethod $cfg