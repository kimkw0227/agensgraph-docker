docker build -t kimkw0227/agensgraph:1.2 -t kimkw0227/agensgraph:latest .

docker run -d -p 5432:5432 -p 8085:8085 --name hello_agraph kimkw0227/agensgraph agens-graph

docker exec -it hello_agraph /bin/bash

docker exec -it hello_agraph agens