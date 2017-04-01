FROM ubuntu:xenial
MAINTAINER Tim Cera <tim@cerazone.net>

RUN    apt-get -y update
RUN    apt-get -y install python3-numpy python3-scipy python3-matplotlib ipython3 ipython3-notebook python3-pandas python3-sympy python3-nose

RUN    apt-get -y install spyder3

RUN    apt-get clean \
    && apt-get purge

# Called when the Docker image is started in the container
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD /start.sh

