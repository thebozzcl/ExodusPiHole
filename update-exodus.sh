#!/bin/bash

DEFAULT_LIST_URL=https://raw.githubusercontent.com/thebozzcl/ExodusPiHole/main/list/exodus-pihole.txt

for domain in $(curl -s ${DEFAULT_LIST_URL}); do
    pihole --regex "${domain}";
    sleep 0.5; # I noticed on my first run that some entries were skipped because of a database lock. This mitigates that.
done
