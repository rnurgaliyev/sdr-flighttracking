# sdr-flighttracking

This repository is a docker container automation for publicly available tools
for aircraft tracking by capturing broadcasted ADS-B signals, tested and made
for Raspberry Pi 3/4/5. All you need is Raspberry Pi with a Raspbian or Ubuntu,
installed Docker, and rtl-sdr dongle.

I hope you know what you are doing, just check `docker-compose.yml` and
enable/disable desired containers. Please keep in mind that receiving and/or
sharing aircraft ADS-B signals may not be completely legal in some countries,
always check local laws.
