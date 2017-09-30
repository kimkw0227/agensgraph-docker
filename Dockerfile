FROM centos:7.3.1611 
MAINTAINER KingKwan <kmkim@bitnine.net>

RUN yum -y install util-linux java-1.8.0-openjdk.x86_64 && useradd agraph && yum clean all
ADD AgensGraph-v1.2.0_linux.tar.gz /home/agraph/
COPY browser /home/agraph/browser/

USER agraph
WORKDIR /home/agraph

ENV AGDATA=/home/agraph/data \
    PATH=/home/agraph/AgensGraph/bin:$PATH \
    LD_LIBRARY_PATH=/home/agraph/AgensGraph/lib:$LD_LIBRARY_PATH

RUN initdb && ag_ctl -w start && createdb && agens -c 'CREATE GRAPH docker_graph' && ag_ctl stop

VOLUME ["/home/agraph/data"]

COPY entrypoint.sh /home/agraph/entrypoint.sh

EXPOSE 5432 8085

ENTRYPOINT ["/home/agraph/entrypoint.sh"]
