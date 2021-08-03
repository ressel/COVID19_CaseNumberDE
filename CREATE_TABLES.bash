#!/bin/bash
# script for tesing
clear
echo "............script started............"
#sleep 1

DIR="RKIcasenumbers"
VARNAME="Datum;BW;BY;BE;BB;HB;HH;HE;MV;NI;NW;RP;SL;SN;ST;SH;TH;DE;File"
#echo ${VARNAME} > TABLE_FALLZAHL
echo ${VARNAME} > TABLE_NEUEFAELLE.csv
#echo ${VARNAME} > TABLE_7DFAELLE
#echo ${VARNAME} > TABLE_7DI
#echo ${VARNAME} > TABLE_TODESFAELLE

cat DATA_UNTIL_2021-02-12/FALLZAHL_2.csv > TABLE_FALLZAHL.csv
#cat DATA_UNTIL_2021-02-12/NEUEFAELLE_2.csv >> TABLE_NEUEFAELLE.csv
cat DATA_UNTIL_2021-02-12/7DFAELLE_2.csv > TABLE_7DFAELLE.csv
cat DATA_UNTIL_2021-02-12/7DI_2.csv > TABLE_7DI.csv
cat DATA_UNTIL_2021-02-12/TODESFAELLE_2.csv > TABLE_TODESFAELLE.csv

for filename in ${DIR}/*ALL; do
     ./RKI2LINES.bash -f=${filename} -c=3 >> TABLE_FALLZAHL.csv
done

for filename in ${DIR}/*ALL; do
     ./RKI2LINES.bash -f=${filename} -c=4 >> TABLE_NEUEFAELLE.csv
done

for filename in ${DIR}/*ALL; do
     ./RKI2LINES.bash -f=${filename} -c=5 >> TABLE_7DFAELLE.csv
done

for filename in ${DIR}/*ALL; do
     ./RKI2LINES.bash -f=${filename} -c=6 -d >> TABLE_7DI.csv
done

for filename in ${DIR}/*ALL; do
     ./RKI2LINES.bash -f=${filename} -c=7 >> TABLE_TODESFAELLE.csv
done
