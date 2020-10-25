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

if [[ -n $FILE ]]; then
    echo "convert RKI to CSV:"
    sed -f convert_rki_data.sed  $FILE | cut -d "," -f 1-3,6 > ${FILE}.csv
fi


