FROM ubuntu:16.04


LABEL maintainer="ian.dynamic@outlook.com"
LABEL version="3.1.0"
LABEL description="LOREM IPSUM"
LABEL created="2017-08-18"

ENV homedir="/opt/taiga"

RUN apt-get update && apt-get install --no-install-recommends -y -q \
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
	libssl-dev \
	&& rm -rf /var/lib/apt/lists/*
	
RUN groupadd -r taiga && useradd -d ${homedir} -r -g taiga taiga -m

WORKDIR ${homedir}
RUN mkdir -p ~/logs

RUN git clone https://github.com/taigaio/taiga-back.git taiga-back
WORKDIR ${homedir}/taiga-back
RUN git checkout 3.1.0 -b stable

#RUN bash
#RUN mkvirtualenv -p /usr/bin/python3.5 taiga

#RUN pip install --upgrade pip setuptools
#RUN pip install -r requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install -r requirements.txt

RUN chown -R taiga:taiga $homedir

USER taiga
WORKDIR ${homedir}/taiga-back

EXPOSE 8000
CMD ["python3", "manage.py runserver"]
