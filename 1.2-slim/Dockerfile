FROM alpine
MAINTAINER KingKwan <kmkim@bitnine.net>

RUN apk update && \
    apk add --no-cache readline bison flex && \
    addgroup -S -g 9999 agraph && \
    adduser -D -G agraph agraph && \
    rm -r  /var/cache/apk/* 


COPY docker-entrypoint.sh /home/agraph/


ENV AGDATA=/home/agraph/data \
    PATH=/home/agraph/agensgraph/bin:$PATH \
    LD_LIBRARY_PATH=/home/agraph/agensgraph/lib:$LD_LIBRARY_PATH
	
ADD agensgraph-alpine.tar.gz /home/agraph/

RUN initdb && ag_ctl -w start && createdb && agens -c 'CREATE GRAPH docker_graph' && ag_ctl stop

VOLUME ["/home/agraph/data"]

EXPOSE 5432 

ENTRYPOINT ["/home/agraph/docker-entrypoint.sh"]
