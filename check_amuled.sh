#!/bin/sh -e

SERVICE=amuled
DATE=`date`
OUTPUT=$(ps aux | grep -v grep | grep ${SERVICE} | cut -d " " -f 1)
if [ ! -z "${OUTPUT}" ] && [ "${OUTPUT}" -gt 0 ] ;
then
        echo "$DATE: $SERVICE service running, everything is fine"
else
        echo "$DATE: $SERVICE is not running"
        /volume1/.@plugins/AppCentral/amule/CONTROL/start-stop.sh start
fi

exit 0
