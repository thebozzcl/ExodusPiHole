#!/bin/bash

TRACKER_LIST_URL=https://reports.exodus-privacy.eu.org/api/trackers
TRACKER_LIST_ETIP_URL=https://etip.exodus-privacy.eu.org/trackers/export
OUTPUT_PATH=./list/exodus-pihole.txt
OUTPUT_ETIP_PATH=./list/exodus-pihole-etip.txt

function parse_exodus_list {
    url=$1
    output_path=$2

    echo "Generating list for URL [$url] and saving in [$output_path]..."
    (
        curl -s "$url" | jq '.trackers[].network_signature' -cr | while read -r domain; do
            if [[ $domain != "" ]]; then
                echo "$domain"
            fi
        done
    ) | sed s/'|'/'\n'/g | sort -u > "${output_path}"

    echo "Done! Fetched $(wc -l < "$output_path") domains from source."
}

parse_exodus_list $TRACKER_LIST_URL $OUTPUT_PATH
parse_exodus_list $TRACKER_LIST_ETIP_URL $OUTPUT_ETIP_PATH
