#!/bin/bash

if [ -z $1 ]; then
	echo "please input the ccm output xml."
	exit
fi

cur_date=`date +"%m%d%y"`
output="./vespa_remove_${cur_date}.xml"
echo "<?xml version='1.0' encoding='UTF-8'?>" > $output
echo "<vespafeed>" >> $output

while read line; do
	docid=`echo $line | grep -P 'documentid\=\"id\:lsbe\:raw_biz\:\:\w{8}(-\w{4}){3}-\w{12}\"' -o`
	echo "<remove document documenttype=\"raw_biz\" $docid></remove>" >> $output
done < $1

echo "</vespafeed>" >> $output
