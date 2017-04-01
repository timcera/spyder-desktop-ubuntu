FROM ubuntu:xenial
MAINTAINER Tim Cera <tim@cerazone.net>

RUN    apt-get -y update
RUN    apt-get -y install numpy scipy matplotlib pandas sympy
RUN    apt-get -y install spyder3

RUN    apt-get clean \
    && apt-get purge

# Called when the Docker image is started in the container
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD /start.sh

