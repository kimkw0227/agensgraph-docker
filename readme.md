This image has been created to help users to use AgensGraph with an ease.
Currently, the image with latest tag contains AgensGraph v.1.2 Community Version.

# Supported Tags
* AgensGraph w/ CentOS 7.3: **1.2**, **latest**

# How To Use: AgensGraph 1.2
1) To run AgensGraph container:  

   => docker run -d -p 5432:5432 -p 8085:8085 kimkw0227/agensgraph agens-graph 

2) To access the container via bash: 

   => docker exec -it [YOUR.CONTAINER.NAME.HERE] /bin/bash 

3) To access the container via agens shell: 

   => docker exec -it [YOUR.CONTAINER.NAME.HERE] agens 
