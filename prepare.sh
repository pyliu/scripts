#!/bin/bash

if [ -z $1 ]; then
    echo "please input folder name."
    exit
fi

cur_date=`date +"%m%d%y"`
iihk="iihk_all.xml"
openrice="openrice_all.xml"
target="/user/pyliu"

kinit
if [ -f $1/$iihk ]; then
    echo "removing old iihk feed files under /user/pyliu on HDFS ..."
    hdfs dfs -rm $target/$iihk
    echo "copying iihk feed source files to HDFS /user/pyliu ... "
    hdfs dfs -put $1/$iihk $target/$iihk
    echo "change iihk permission on HDFS ... "
    hdfs dfs -chmod 777 $target/$iihk
fi
if [ -f $1/$openrice ]; then
    echo "removing old openrice feed files under /user/pyliu on HDFS ..."
    hdfs dfs -rm $target/$openrice
    echo "copying openrice feed source files to HDFS /user/pyliu ... "
    hdfs dfs -put $1/$openrice $target/$openrice
    echo "change openrice permission on HDFS ... "
    hdfs dfs -chmod 777 $target/$openrice
fi

hdfs dfs -chmod 777 $target
echo "done!"

