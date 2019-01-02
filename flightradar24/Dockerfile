FROM arm32v7/ubuntu:bionic

# Copy startup script
COPY assets/flightradar24.sh /usr/bin/flightradar24.sh
RUN chmod 775 /usr/bin/flightradar24.sh

# Container start point
CMD ["/usr/bin/flightradar24.sh"]
