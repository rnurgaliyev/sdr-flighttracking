FROM arm32v7/debian:buster

# Add FlightAware repository and update apt cache
ADD https://de.flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_6.0_all.deb /tmp/piaware-repository.deb
RUN dpkg -i /tmp/piaware-repository.deb
RUN apt-get update

# Install piaware
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y piaware

# Configure piaware
RUN piaware-config allow-auto-updates yes && \
  piaware-config allow-manual-updates yes && \
  piaware-config receiver-host dump1090 && \
  piaware-config receiver-port 30005 && \
  piaware-config receiver-type other && \
  piaware-config allow-mlat true

# Copy startup script
COPY assets/flightaware.sh /usr/bin/flightaware.sh
RUN chmod 755 /usr/bin/flightaware.sh

# Container start point
CMD ["/usr/bin/flightaware.sh"]
