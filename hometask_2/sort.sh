#!/bin/bash
curl -O http://yoko.ukrtux.com:8899/versions.txt 2> /dev/null
sed 's/-/./' versions.txt > versionstemp.txt 

sort -t. -k2n -k3n -k4n versionstemp.txt > versionstemp2.txt

sed 's/\./-/' versionstemp2.txt > versionstemp3.txt

cat versionstemp3.txt

rm versionstemp.txt
rm versionstemp2.txt
rm versionstemp3.txt
