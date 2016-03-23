#!/bin/bash
echo "Input file name prefix:"
read file_prefix
echo "Input table number:"
read num
table="page_contrib_"${num}

file_postfix=".xml.csv"
for i in {1..5000..1}; do
    file_name=${file_prefix}${i}${file_postfix}
    printf "Inserting file named: %s\n" ${file_name}
    printf "%s started..." ${file_name} >> ${file_prefix}".log"
    if [ ! -f ${file_name} ]; then
        printf "!!!!! %s does not exist.\n" ${file_name}
        exit 1
    fi

    IFS=,
    while read column1 column2
    do
        echo "INSERT INTO ${table} (page, contrib) VALUES ('$column1', '$column2');"
done < ${file_name} | mysql -u enwiki -ppassword enwiki;
    printf "\t done!!!\n" >> ${file_prefix}".log"
done

exit 1
