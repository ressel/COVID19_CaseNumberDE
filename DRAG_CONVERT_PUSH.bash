#!/bin/bash
# script for tesing
clear
echo "............script started............"
sleep 1

result=`python3  rki_get_data.py`

file="file_of_the_day"
IFS= read filename < "$file"

echo $filename
PWD=`pwd`
source ${PWD}/RKI2CSV.bash -f=${filename} ;

cat ${filename}.csv >> COVID19_Cases_Bundeslaender_DE.csv
mv ${filename} ${filename}.csv RKIcasenumbers
mv ${filename}ALL RKIcasenumbers
