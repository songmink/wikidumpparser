#!/bin/bash
echo "Enter the files prefix:"
read file_prefix
file_postfix=".xml.csv"
out=${file_prefix}{merged.csv}

for i in {1..5000..1}; do
	file_name=${file_prefix}${i}${file_postfix}
	printf "Merging file: %s\n" ${file_name}

	if [ ! -f ${file_name} ]; then
		printf "%s does not exist.\n" ${file_name}
		exit 1
	fi

	cat ${file_name} >> ${out}
done
exit 1