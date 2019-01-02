#!/bin/sh

piaware-config flightaware-user $FLIGHTAWARE_USER
piaware-config flightaware-password $FLIGHTAWARE_PASSWORD

if [ ! -z "$FLIGHTAWARE_FEEDER_ID" ]; then
  piaware-config feeder-id $FLIGHTAWARE_FEEDER_ID
fi

piaware -debug
