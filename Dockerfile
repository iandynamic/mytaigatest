FROM ubuntu:16.04


LABEL maintainer="ian.dynamic@outlook.com"
LABEL version="3.1.0"
LABEL description="LOREM IPSUM"
LABEL created="2017-08-09"

ENV homedir="/opt/taiga"

RUN apt-get update && apt-get install --no-install-recommends -y \
	build-essential \
	git-core \
	binutils-doc \
	autoconf \
	flex \
	bison \
	libjpeg-dev \
	libfreetype6-dev \
	zlib1g-dev \
	libzmq3-dev \
	libgdbm-dev \
	libncurses5-dev \
	automake \
	libtool \
	libffi-dev \
	curl \
	tmux \
	gettext \
	python3 \
	python3-pip \
	python-dev \
	python3-dev \
	python-pip \
	virtualenvwrapper \
	libxml2-dev \
	libxslt-dev \
	&& rm -rf /var/lib/apt/lists/*
	
RUN groupadd -r taiga && useradd -d ${homedir} -r -g taiga taiga -m 
