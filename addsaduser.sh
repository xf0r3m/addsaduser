#!/bin/bash

filename=$1;

fileLength=$(cat $filename | wc -l | awk '{printf $1}');

translate_pl_sign () {

    rval=$( echo $1 | sed -e 's/ą/a/g' \
            -e 's/ś/s/g' \
            -e 's/ę/e/g' \
            -e 's/ż/z/g' \
            -e 's/ź/z/g' \
            -e 's/ć/c/g' \
            -e 's/ń/n/g' \
            -e 's/ó/o/g' \
            -e 's/ł/l/g');
    
    echo $rval;

}

i=1;
while [ $i -le $fileLength ]; do

    line=$(cat $filename | sed -n "${i}p");
    givenName=$(echo $line | cut -d "," -f 1);
    surname=$(echo $line | cut -d "," -f 2);
    fName=$(translate_pl_sign $(echo $line | cut -d "," -f 1 | tr "[:upper:]" "[:lower:]"));
    lName=$(translate_pl_sign $(echo $line | cut -d "," -f 2 | tr "[:upper:]" "[:lower:]"));

    uname="$(echo $fName | cut -c 1)$(echo $lName)";

    echo "samba-tool user add $uname --given-name=$givenName --surname=$surname --login-shell=/bin/false";
    echo "net sam set pwdmustchangenow $uname yes";

    i=$(expr $i + 1);

done