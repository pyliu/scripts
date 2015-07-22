#!/bin/bash
id=$1
if [ -z $id ]; then
    echo "please input the gid."
    echo "e.g. $0 500561867"
    exit
fi

env=$2
if [ -z $env ]; then
    env=".stage"
else
    env=""
fi


vespa_remove_xml='<?xml version="1.0" encoding="utf-8" ?><vespafeed><remove documenttype="raw_biz" documentid="id:lsbe:raw_biz::${id}"></remove></vespafeed>'

echo "About to remove id:lsbe:raw_biz::${id} from vespa $env ... "

curl --header "Content-Type: application/xml" --data '<?xml version="1.0" encoding="utf-8" ?><vespafeed><remove documenttype="raw_biz" documentid="id:lsbe:raw_biz::${id}"></remove></vespafeed>' "http://spool1$env.lsbe.gq1.yahoo.com:4080/feed?route=feeding&abortondocumenterror=false&abortonfeederror=false"

