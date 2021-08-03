sed -f ../convert_table.sed  7DFAELLE.csv | cut -f 1 -d ";" > TF1
sed -f ../convert_table.sed  7DFAELLE.csv | cut -f 2-18 -d ";" > TF2
paste -d";" TF1 TF2 TF1 > 7DFAELLE_2.csv

sed -f ../convert_table.sed  7DI.csv | cut -f 1 -d ";" > TF1
sed -f ../convert_table.sed  7DI.csv | cut -f 2-18 -d ";" > TF2
paste -d";" TF1 TF2 TF1 > 7DI_2.csv

sed -f ../convert_table.sed  FALLZAHL.csv | cut -f 1 -d ";" > TF1
sed -f ../convert_table.sed  FALLZAHL.csv | cut -f 2-18 -d ";" > TF2
paste -d";" TF1 TF2 TF1 > FALLZAHL_2.csv

sed -f ../convert_table.sed  TODESFAELLE.csv | cut -f 1 -d ";" > TF1
sed -f ../convert_table.sed  TODESFAELLE.csv | cut -f 2-18 -d ";" > TF2
paste -d";" TF1 TF2 TF1 > TODESFAELLE_2.csv
