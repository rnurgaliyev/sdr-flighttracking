FROM arm32v7/ubuntu:bionic

# Add FlightAware repository and update apt cache
ADD http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_3.7.1_all.deb /tmp/piaware-repository.deb
RUN dpkg -i /tmp/piaware-repository.deb
RUN apt-get update

# Install prerequisites
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl apt-utils wget lighttpd libterm-ui-perl

# Install dump1090 from FlightAware and prerequisites
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dump1090-fa

# Expose web dashboard
EXPOSE 8080

# Export ports for sharing data
EXPOSE 30001
EXPOSE 30002
EXPOSE 30003
EXPOSE 30004
EXPOSE 30005
EXPOSE 30104

# Copy startup script
COPY assets/dump1090-fa.sh /usr/bin/dump1090-fa.sh
RUN chmod 755 /usr/bin/dump1090-fa.sh

# Container start point
CMD ["/usr/bin/dump1090-fa.sh"]
