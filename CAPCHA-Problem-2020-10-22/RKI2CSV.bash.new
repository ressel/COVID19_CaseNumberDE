#!/bin/bash
for i in "$@"
do
case $i in
    -f=*|--file=*)
    FILE="${i#*=}"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done
echo "FILE = ${FILE}"
rm TODAY
DATE=`date "+%Y-%m-%d"`
for value in {1..17}
do
echo $DATE >> TODAY
done

if [[ -n $FILE && -n $DATE ]]; then
    echo "convert RKI to CSV:"
# before CAPCHA was installed 2020-10-22
#   sed -f convert_rki_data.sed  $FILE | cut -d "," -f 1-3,6 > ${FILE}.csv
# since 2020-10-22
    sed -f convert_rki_data.sed  $FILE | cut -d ";" -f 1-2,6 > ${FILE}.sed
fi

paste -d";" TODAY ${FILE}.sed > ${FILE}.csv

