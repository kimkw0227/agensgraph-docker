FROM centos:7.3.1611 
MAINTAINER KingKwan <kmkim@bitnine.net>

RUN yum -y install util-linux && useradd agraph && yum clean all
ADD AgensGraph-v1.2.0_linux.tar.gz /home/agraph/

USER agraph
WORKDIR /home/agraph

COPY entrypoint.sh /home/agraph/entrypoint.sh

ENV AGDATA=/home/agraph/data \
    PATH=/home/agraph/AgensGraph/bin:$PATH \
    LD_LIBRARY_PATH=/home/agraph/AgensGraph/lib:$LD_LIBRARY_PATH

RUN initdb && ag_ctl -w start && createdb && agens -c 'CREATE GRAPH docker_graph' && ag_ctl stop && chmod +x /home/agraph/entrypoint.sh

VOLUME ["/home/agraph/data"]

EXPOSE 5432

ENTRYPOINT ["/home/agraph/entrypoint.sh"]
