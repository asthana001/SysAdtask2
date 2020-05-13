FROM ubuntu

#USER root

SHELL ["/bin/bash" , "-c"]

RUN apt-get update && \
      apt-get -y install sudo && \
      apt-get install -y wget

COPY ./attendance /root/
COPY ./position /root/
COPY ./Linux/createuser /root/
COPY ./Linux/permission /root/
COPY ./Linux/sch /root/
COPY ./Linux/attd /root/
COPY ./Linux/rcd /root/
COPY ./Linux/fattd /root/
COPY ./Linux/near /root/
COPY ./Linux/aliases /root/


RUN chmod +x /root/createuser &&  bash /root/createuser
RUN chmod +x /root/permission && bash /root/permission
RUN chmod +x /root/sch && bash /root/sch      
RUN chmod +x /root/attd && bash /root/attd 
RUN chmod +x /root/rcd 
RUN chmod +x /root/fattd && bash /root/fattd
RUN chmod +x /root/near && bash /root/near
RUN chmod +x /root/aliases


ENTRYPOINT bash /root/rcd ;bash /root/aliases ; /bin/bash

