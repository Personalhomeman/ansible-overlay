FROM debian:jessie-backports

WORKDIR /ansible-overlay

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports -y --force-yes install \
    bash \
    python2.7-minimal \
    python-virtualenv \
    python-apt \
    cpio \
    pigz

RUN virtualenv --system-site-packages /ansible
RUN /ansible/bin/pip install --upgrade pip setuptools
RUN /ansible/bin/pip install ansible

COPY . /ansible-overlay
