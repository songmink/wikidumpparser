#!/bin/bash

echo "Enter the files prefix: "
read file_prefix
save_dir=${file_prefix}"csv"

if [ ! -d ${save_dir} ]; then
    mkdir ${save_dir}
fi

file_postfix=".xml"

for i in {1..5000..1}; do
    file_name=${file_prefix}${i}${file_postfix}
    printf "Parsing file: %s\n" ${file_name}

    if [ ! -f ${file_name} ]; then
        printf "%s does not exist.\n" ${file_name}
        exit 1
    fi

    if [ -e wikicontributors.pl ]; then
        wikicontributors.pl ${file_name} > ./${save_dir}/${file_name}".csv"
    fi

done
