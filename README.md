# ExodusPiHole

## What is this?

I mined the tracker domain regexes from [Exodus-Privacy](https://reports.exodus-privacy.eu.org/en/) so I could use them in my Pi-Hole. Shout-out to both Exodus and Pi-Hole, they're both awesome projects.

The generator script is pretty janky, I'm not too good with bash or regular expressions and I didn't spend too much time on it. This is not a Pi-Hole "adlist" in that it's not just a list of domains, it's a whole bunch of regexes for each tracker. You'll have to add these domains to your blocklist manually.

## How often is this list updated?

Probably whenever I remember to do so. I might set up a script to automate it.

## Before you use it

This list might break stuff for you. For example, `facebook.com` is in it more than once. You should allowlist any domains you want to keep, or clone the project and tailor it to your needs.

## How do I use it?

The easiest way to add these regexes to your Pi-Hole is by running a script like so:

```bash
#!/bin/bash

for domain in `curl -s https://raw.githubusercontent.com/thebozzcl/ExodusPiHole/main/list/exodus-pihole.txt`;
do 
    pihole --regex $domain;
    sleep 0.5; # I noticed on my first run that some entries were skipped because of a database lock. This mitigates that.
done
```
