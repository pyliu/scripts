#!/bin/bash

if [ -z $1 ]; then
	echo "please input the ccm output xml."
	exit
fi

output="vespa.xml"
echo "<?xml version=\"1.0\" encoding=\"utf-8\" ?><vespafeed>" > $output
cat $1 >> $output
echo "</vespafeed>" >> $output

