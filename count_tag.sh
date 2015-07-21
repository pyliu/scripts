#!/bin/bash
file=$1
if [ -x $file ]; then
    echo "please input file path."
    echo "e.g. $0 ./soeasy_all.xml provider"
    exit
fi

tag=$2
if [ -z $tag ]; then
    echo "please input tag name."
    echo "e.g. $0 ./soeasy_all.xml provider"
    exit
fi

awk "/<$tag>.*<\/$tag>/" $file | sort -n | uniq -c

