FROM ubuntu

RUN apt-get update && apt-get upgrade -y

RUN apt install sudo

RUN sudo adduser --gecos '' jezper

RUN echo jezper:admin | chpasswd

RUN usermod -aG sudo jezper

USER jezper

VOLUME $HOME/Documents:/home/jezper
