#!/bin/bash
echo "Input file prefix:"
read file_prefix

out=${file_prefix}"size.csv"

for i in {1..5000..1}; do
    xml_file=${file_prefix}${i}".xml"
    csv_file=${xml_file}".csv"

    printf "Reading %s and %s\n" ${xml_file} ${csv_file}

    if [ ! -f ../${xml_file} ] || [ ! -f ${csv_file} ]; then
        printf "!!!!! %s or %s does not exist.\n" ${xml_file} ${csv_file}
        exit 1
    fi

    IFS=,
    read c1 c2 < ${csv_file}
    printf "%s," $c1 >> ${out}
    stat --printf="%s," ../${xml_file} >> ${out}
    cat ${csv_file} | xargs -l echo | wc -l >> ${out}
done
exit 1
