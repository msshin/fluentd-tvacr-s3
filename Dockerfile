FROM ubuntu:12.04
MAINTAINER msshin <msshin@enswer.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y -q curl libcurl3 sudo ruby-dev vim git net-tools
RUN apt-get install -y python-pip tmux
RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-precise.sh | sh

ENV LD_PRELOAD /usr/lib/fluent/jemalloc/lib/libjemalloc.so
RUN ulimit -n 65536

# Install plugins
RUN /usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-s3
RUN /usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-ltsv-parser
RUN /usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-namedpipe
