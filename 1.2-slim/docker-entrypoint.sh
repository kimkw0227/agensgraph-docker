#!/bin/sh
imagename="kimkw0227/agensgraph-docker"
tag="1.2.0"

rm /tmp/*.pid &> /dev/null
mode=$1
usage="\n******************************************************************************\n\nTo run AgensGraph container:  \n\n=> docker run -d -p 5432:5432 kimkw0227/agensgraph agens-graph \n\nTo access the container via shell: \n\n=> docker exec -it [YOUR.CONTAINER.NAME.HERE] sh --login \n\nTo access the container via agens shell: \n\n=> docker exec -it [YOUR.CONTAINER.NAME.HERE] agens \n\n******************************************************************************"

function main(){
    case $mode in
    (agens-graph)
        runAgensGraph
        ;;         
    (run-shell)
        runSh
        ;;
    (help)
	    echo -e $usage
		;;
    (*)
        echo -e $usage
        ;;
    esac
}

function runAgensGraph(){
    ag_ctl -D "$AGDATA" -o "-c shared_buffers=512MB" -o "-c listen_addresses='*'" -o "-c graph_path='docker_graph'" -w start && \
    tail -f /home/agraph/data/logfile
}

function runSh(){
    sh --login
}

main
