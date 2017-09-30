FROM alpine
MAINTAINER KingKwan <kmkim@bitnine.net>

RUN apk update && \
    apk add --no-cache readline bison flex && \
    adduser -D agraph && \
    rm -r  /var/cache/apk/* 

USER agraph
WORKDIR /home/agraph/

ENV AGDATA=/home/agraph/data \
    PATH=/home/agraph/agensgraph/bin:$PATH \
    LD_LIBRARY_PATH=/home/agraph/agensgraph/lib:$LD_LIBRARY_PATH
	
ADD agensgraph-alpine.tar.gz /home/agraph/

RUN initdb && ag_ctl -w start && createdb && agens -c 'CREATE GRAPH docker_graph' && ag_ctl stop
VOLUME ["/home/agraph/data"]

COPY entrypoint.sh /home/agraph/entrypoint.sh

EXPOSE 5432 

ENTRYPOINT ["/home/agraph/entrypoint.sh"]

