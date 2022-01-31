# ExodusPiHole

## What is this?

I mined the tracker domain regexes from [Exodus-Privacy](https://reports.exodus-privacy.eu.org/en/) so I could use them in my Pi-Hole. Shout-out to both Exodus and Pi-Hole, they're both awesome projects.

The generator script is pretty janky, I'm not too good with bash or regular expressions and I didn't spend too much time on it. This is not a Pi-Hole "adlist" in that it's not just a list of domains, it's a whole bunch of regexes for each tracker. You'll have to add these domains to your blocklist manually.

This generates two lists: `./list/exodus-pihole.txt` and `./list/exodus-pihole-etip.txt`. The ETIP list includes experimental rules.

## How often is this list updated?

Probably whenever I remember to do so. I might set up a script to automate it.

## Before you use it

This list might break stuff for you. For example, `facebook.com` is in it more than once. You should allowlist any domains you want to keep, or clone the project and tailor it to your needs.

Please note that the Pi-Hole bash commands don't like the longer regexes and fail to process them. You'll need to add those manually using the GUI. I haven't figured out a workaround yet.

## How do I use it?

The easiest way to add these regexes to your Pi-Hole is by running a script. See `update-exodus.sh` for an example, which allows you to specify the URL to read from in case you want to use the ETIP list.
