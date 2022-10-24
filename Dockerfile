FROM ubuntu

RUN apt-get update && apt-get upgrade -y

RUN apt install sudo

RUN sudo apt-get install git-all

RUN sudo apt install python3

RUN sudo apt install nodejs

RUN sudo adduser --gecos '' jezper

RUN echo jezper:admin | chpasswd

RUN usermod -aG sudo jezper

USER jezper

VOLUME ~/Documents/home:jezper