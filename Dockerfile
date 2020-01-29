FROM debian:stretch-backports

WORKDIR /ansible-overlay

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -t stretch-backports -y --force-yes install \
    bash \
    python2.7-minimal \
    python-virtualenv \
    python-apt \
    cpio \
    pigz

RUN virtualenv --system-site-packages /ansible
RUN /ansible/bin/pip install --upgrade pip setuptools
RUN /ansible/bin/pip install ansible==2.9.0

COPY . /ansible-overlay
