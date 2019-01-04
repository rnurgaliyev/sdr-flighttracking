# sdr-flighttracking
This repository is a docker container automation for publicly available tools for RTL-SDR aircraft tracking, tested and made for Raspberry Pi 2/3. All you need is Raspberry Pi 2/3 with latest Raspbian OS and RTL-SDR dongle (RTL283x).
I hope you know what you are doing, just check `docker-compose.yml` and enable/disable desired containers. Please keep in mind that receiving and/or sharing aircraft ADS-B signals may not be completely legal in some countries, always check local laws ;)

By default, it will run three containers: `dump1090-fa` to receive ADS-B signals, `flightaware` to report to flightaware.com and `flightradar24` to report to flightradar24.com. If you just want to receive ADS-B and don't want to share received data, you can just run the `dump1090-fa` container.

## Install docker and docker-compose
```shell
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh ./get-docker.sh
$ apt install python-pip
$ pip install docker-compose
```

## Write credentials to env files
```shell
$ cat > flightradar24.env
FLIGHTRADAR24_KEY=xxx
$ cat > flightaware.env
FLIGHTAWARE_USER=user
FLIGHTAWARE_PASSWORD=password
FLIGHTAWARE_FEEDER_ID=feeder-id (if you have it)
```
## Run the whole thing
```shell
$ docker-compose up -d
```

## Check flight tracking
Access your Raspberry Pi on port 8080, and enjoy! Check logs of corresponding containers to know if communication with specific service is fine.
