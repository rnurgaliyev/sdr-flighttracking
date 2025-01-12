FROM debian:bookworm

# Install prerequisites first
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt install -y ca-certificates

# Add FlightAware repository and update apt cache
ADD https://www.flightaware.com/adsb/piaware/files/packages/pool/piaware/f/flightaware-apt-repository/flightaware-apt-repository_1.2_all.deb /tmp/flightaware-apt-repository.deb
RUN dpkg -i /tmp/flightaware-apt-repository.deb
RUN apt update

# Install piaware
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y piaware

# Configure piaware
RUN piaware-config allow-auto-updates no && \
    piaware-config allow-manual-updates no && \
    piaware-config receiver-host dump1090 && \
    piaware-config receiver-port 30005 && \
    piaware-config receiver-type other && \
    piaware-config allow-mlat yes && \
    piaware-config use-gpsd no

# Copy startup script
COPY assets/flightaware.sh /usr/bin/flightaware.sh
RUN chmod 755 /usr/bin/flightaware.sh

# Container start point
CMD ["/usr/bin/flightaware.sh"]
