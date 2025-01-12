#!/bin/sh

if [ ! -z "$FLIGHTRADAR24_KEY" ]; then
    echo "fr24key=\"$FLIGHTRADAR24_KEY\"" >> /etc/fr24feed.ini
fi

fr24feed
