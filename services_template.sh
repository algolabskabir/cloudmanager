#!/bin/bash
#curl -u admin:admin https://artifactory.iot83.com/artifactory/libs-incs83/bin/scd-bash.tar.gz
cd $5
pwd
var1=$'\x22hostName\x22 :'
var10=$'\x22hostNameRange\x22 :'
var2=$'\x22'
var41="$var1 $var2 $2 $var2"
var42="$var10 $var2 $3,$4 $var2"
sudo sed -i "s/magicnumber1/${var41}/g" template.json
sudo sed -i "s/magicnumber2/${var42}/g" template.json
url1=$' -X POST -H \x22Content-Type: application/json\x22 -d @template.json  '
url1+="http://admin:admin@$1:7180/api/v12/cm/importClusterTemplate"
echo $url1
curl $url1
