#!/bin/bash

TRACKER_LIST_URL=https://etip.exodus-privacy.eu.org/trackers/export
OUTPUT_PATH=./list/exodus-pihole.txt
NO_COMMENT_PATH=./list/exodus-pihole.no-comment.txt

rm $OUTPUT_PATH

curl -s $TRACKER_LIST_URL | jq '.trackers[].network_signature' -cr | while read -r domain
do
        if [[ $domain = "" ]]
        then
                continue
        fi
        echo $domain
        echo $domain >> $OUTPUT_PATH
done
