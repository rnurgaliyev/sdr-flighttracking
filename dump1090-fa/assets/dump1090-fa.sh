#!/bin/sh

# Start lighttpd for dump1090-fa dashboard
/usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf

# Configure options for dump1090-fa
RECEIVER_OPTIONS="--device-index 0 --device-type rtlsdr --gain -10 --ppm 0"
DECODER_OPTIONS="--max-range 360"
NET_OPTIONS="--net --net-ro-size 512 --net-ro-interval 1"
JSON_OPTIONS="--write-json /run/dump1090-fa --json-location-accuracy 1"
MISC_OPTIONS="--metric --quiet"

# Make sure directory for json exists
mkdir -p /run/dump1090-fa

# Run dump1090-fa
/usr/bin/dump1090-fa $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS $MISC_OPTIONS
