FROM arm32v7/ubuntu:bionic

# Add FlightAware repository and update apt cache
ADD http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_3.6.3_all.deb /tmp/piaware-repository.deb
RUN dpkg -i /tmp/piaware-repository.deb
RUN apt-get update

# Container start point
CMD ["/bin/bash"]
