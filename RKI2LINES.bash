#!/bin/bash
# switch to dots as floating number decimal character
export LC_NUMERIC="en_US.UTF-8"
NOQUIT=0
for i in "$@"
do
case $i in
    -f=*|--file=*)
    FILE="${i#*=}"
    shift # past argument=value
    ;;
    -c=*|--column=*)
    COLUMN="${i#*=}"
    shift # past argument=value
    ;;
    -d|--noquit)
    FLOAT=1
    shift # past argument with no value
    ;;
    -n|--noquit)
    NOQUIT=1
    shift # past argument with no value
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

if [ ${NOQUIT} -eq "1" ]; then
    echo "FILE = ${FILE}"
    echo "COLUMN = ${COLUMN}"
fi

if [[ -n $FILE ]] &&  [[ -n $COLUMN ]]; then
    DATE=`echo ${FILE} | sed "s/RKIcasenumbers\/RKI_Corona_//" | cut -f 1 -d"T"`
    #echo "convert RKI to TABLE:"
    NI=`sed -f convert_rki_data.sed $FILE | cut -f $COLUMN -d ";"`
    printf "%s;" ${DATE}
    if [[ $FLOAT == 1 ]]; then
    	for ni in $NI
    	do
       	 printf "%f;" ${ni}
    	done
    else
    	for ni in $NI
    	do
       	 printf "%i;" ${ni}
    	done
    fi
    printf "${FILE}\n"
fi


