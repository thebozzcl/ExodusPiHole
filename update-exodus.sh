#!/bin/bash

DEFAULT_LIST_URL=https://raw.githubusercontent.com/thebozzcl/ExodusPiHole/main/list/exodus-pihole.txt

regex_list_url=${1:-$DEFAULT_LIST_URL}

for domain in `curl -s https://raw.githubusercontent.com/thebozzcl/ExodusPiHole/main/list/exodus-pihole.txt`;
do 
    pihole --regex $domain;
    sleep 0.5; # I noticed on my first run that some entries were skipped because of a database lock. This mitigates that.
done
