This image has been created to help users to use AgensGraph with an ease.
Currently, the image with latest tag contains AgensGraph v.1.3.1 Community Version.

# Supported Tags
* AgensGraph 1.3.1 w/ CentOS 7.3: **1.3.1**, **latest**
* AgensGraph 1.3.0 w/ CentOS 7.3: **1.3.0**
* AgensGraph 1.2.1 w/ CentOS 7.3: **1.2.1**
* AgensGraph 1.2.0 w/ CentOS 7.3: **1.2.0**

# How To Use: AgensGraph Docker
1) To run AgensGraph container:  

   => docker run -d -p 5432:5432 kimkw0227/agensgraph-docker 

2) To access the container via agens shell: 

   => docker exec -it [YOUR.CONTAINER.NAME.HERE] agens -U agraph
     OR
   => docker exec -it --user agraph [YOUR.CONTAINER.NAME.HERE] agens

# Quick Reference
* AgensGraph Quick Guide: http://bitnine.net/support/documents_backup/quick-start-guide-html
* Where to file issues: https://github.com/bitnine-oss/agensgraph/issues

This image is for non-production usage only!(ex. testing or experiencing the AgensGraph)
If you need an image for production, please contact **"agens@bitnine.net"**.

Cheers.
