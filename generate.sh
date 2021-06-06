#!/bin/bash

TRACKER_LIST_URL=https://etip.exodus-privacy.eu.org/trackers/export
OUTPUT_PATH=./list/exodus-pihole.txt
NO_COMMENT_PATH=./list/exodus-pihole.no-comment.txt

echo "# Generated on `date +'%D %T'`" > $OUTPUT_PATH

curl -s $TRACKER_LIST_URL | jq '.trackers[]' -c | while IFS= read -r tracker
do
	name=`echo $tracker | jq '.name' -r`
        echo $name
	echo "# $name" >> $OUTPUT_PATH

	rule=`IFS=';' echo $tracker | jq '.network_signature' -r`
        if [[ $rule = "" ]]
        then
                continue
        fi
        echo $rule 
        echo $rule >> $OUTPUT_PATH
done

cat $OUTPUT_PATH | grep -v "#" > $NO_COMMENT_PATH
