#!/bin/sh

if [ ! -z "$FLIGHTAWARE_FEEDER_ID" ]; then
    piaware-config feeder-id $FLIGHTAWARE_FEEDER_ID
fi

piaware -debug
