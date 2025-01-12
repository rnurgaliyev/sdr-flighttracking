# rtl-sdr git driver build phase, necessary for later blog v4 dongles

FROM debian:bookworm AS build

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt -y install build-essential libusb-1.0-0-dev \
    git debhelper pkg-config cmake

RUN git clone https://github.com/rtlsdrblog/rtl-sdr-blog
RUN cd rtl-sdr-blog && dpkg-buildpackage -b --no-sign

# Assemble final container

FROM debian:bookworm

# Install prerequisites first
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt install -y ca-certificates

# Add FlightAware repository and update apt cache
ADD https://www.flightaware.com/adsb/piaware/files/packages/pool/piaware/f/flightaware-apt-repository/flightaware-apt-repository_1.2_all.deb /tmp/flightaware-apt-repository.deb
RUN dpkg -i /tmp/flightaware-apt-repository.deb
RUN apt update

# Install light http server and dump1090 from FlighAware
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    lighttpd dump1090-fa libusb-1.0-0-dev

# Install latest rtl-sdr driver
COPY --from=build /*.deb /root
RUN cd /root && dpkg -i *.deb

# Copy startup script
COPY assets/dump1090-fa.sh /usr/bin/dump1090-fa.sh
RUN chmod 755 /usr/bin/dump1090-fa.sh

# Expose web dashboard
EXPOSE 8080

# Export ports for sharing data
EXPOSE 30001
EXPOSE 30002
EXPOSE 30003
EXPOSE 30004
EXPOSE 30005
EXPOSE 30104

# Container start point
CMD ["/usr/bin/dump1090-fa.sh"]
