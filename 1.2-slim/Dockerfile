FROM alpine
MAINTAINER KingKwan <kmkim@bitnine.net>

RUN apk update && \
    apk add --no-cache readline bison flex && \
    adduser -D agraph && \
    rm -r  /var/cache/apk/* 

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /

USER agraph
WORKDIR /home/agraph/

ENV AGDATA=/home/agraph/data \
    PATH=/home/agraph/agensgraph/bin:$PATH \
    LD_LIBRARY_PATH=/home/agraph/agensgraph/lib:$LD_LIBRARY_PATH
	
ADD agensgraph-alpine.tar.gz /home/agraph/

RUN initdb && ag_ctl -w start && createdb && agens -c 'CREATE GRAPH docker_graph' && ag_ctl stop

VOLUME ["/home/agraph/data"]

EXPOSE 5432 

ENTRYPOINT ["docker-entrypoint.sh"]
