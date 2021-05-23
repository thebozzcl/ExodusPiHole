#!/bin/bash

TRACKER_LIST_URL=https://reports.exodus-privacy.eu.org/en/trackers/

echo "# Generated on `date +'%D %T'`"

for tracker in `curl -s "$TRACKER_LIST_URL" | grep -E "/en/trackers/[0-9]{1,}/" | cut -d '/' -f4`
do
	url=$TRACKER_LIST_URL$tracker/
	echo "# $url"

	rule=`curl -s "$url" | grep "Network detection rule" | sed "s/.*<code>//g" | sed "s/<\/code>//g" | sed "s/|//g"`
	if [[ $rule == *"NC"* ]] || [[ $rule == *"404"* ]]
	then
		echo "# No rule found"
		continue
	fi

	for match in $rule; do
		echo $match
	done

	sleep 1
done
