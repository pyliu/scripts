#!/bin/bash
input=$1
if [ -z $1 ]; then
	input="vespa.xml"
fi

curl --header "Content-Type: application/xml" --data-binary @$input "http://spool1.stage.lsbe.gq1.yahoo.com:4080/feed?route=feeding&abortondocumenterror=false&abortonfeederror=false"

