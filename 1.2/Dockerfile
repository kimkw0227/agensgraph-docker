FROM centos:7.3.1611 
MAINTAINER KingKwan <kmkim@bitnine.net>

RUN yum -y install util-linux && useradd agraph && yum clean all
VOLUME ["/home/agraph/"]

ADD AgensGraph-v1.2.0_linux.tar.gz /home/agraph/

USER agraph
WORKDIR /home/agraph
COPY docker-entrypoint.sh /home/agraph/

ENV AGDATA=/home/agraph/data \
    PATH=/home/agraph/AgensGraph/bin:$PATH \
    LD_LIBRARY_PATH=/home/agraph/AgensGraph/lib:$LD_LIBRARY_PATH

RUN initdb && ag_ctl -w start && createdb && agens -c 'CREATE GRAPH docker_graph' && ag_ctl stop 

EXPOSE 5432

ENTRYPOINT ["/home/agraph/docker-entrypoint.sh"]
