# Provides a base Ubuntu (14.04) image with Twisted 14.0.0 installed

FROM        ubuntu:14.04
MAINTAINER  Twisted Matrix Labs <twisted-python@twistedmatrix.com>

# Last build date - this can be updated whenever there are security updates so
# that everything is rebuilt
ENV         security_updates_as_of 2014-07-06

# Install security updates and required packages
RUN         apt-get update && \
            apt-get -y upgrade && \
            apt-get -y install -q build-essential && \
            apt-get -y install -q python-dev libffi-dev libssl-dev python-pip

# Install required python packages, and twisted
RUN         pip install twisted==14.0.0

WORKDIR     /
COPY        proxy.py proxy.py

CMD ["bash"]