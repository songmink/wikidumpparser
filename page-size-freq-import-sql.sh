#!/bin/bash
echo "Input file name:"
read file_name
echo "Input table number:"
read num
table="page_size_freq_"${num}

IFS=,
while read column1 column2 column3
do
    echo "INSERT INTO ${table} (page, size, freq) VALUES ('$column1', '$column2', '$column3');"
done < ${file_name} | mysql -u enwiki -pmoore161 enwiki;

exit 1
