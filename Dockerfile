FROM dorowu/ubuntu-desktop-lxde-vnc
MAINTAINER Mark Fernandes <mark.fernandes@ifr.ac.uk>
# Environment to deliver EBI RNAseq course using  LXDE and VNC server under Docker
# Based uponn http://www.ebi.ac.uk/training/online/course/ebi-next-generation-sequencing-practical-course/rna-sequencing/rna-seq-analysis-transcriptome 
#
RUN REL="$(lsb_release -c -s)"
# Add the appropriate repositories including CRAN
RUN \
	  apt-get update && \
	  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
	   apt-get install -y  software-properties-common && \
	add-apt-repository  "deb http://archive.ubuntu.com/ubuntu trusty universe" && \
	add-apt-repository  "deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse" && \
	add-apt-repository  "deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse" && \
	add-apt-repository  "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse" && \
	add-apt-repository  "deb http://cran.ma.imperial.ac.uk/bin/linux/ubuntu trusty/"

RUN apt-get update && apt-get install -y wget git unzip && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
RUN mkdir /harvest && cd /harvest && wget https://github.com/marbl/harvest/releases/download/v1.1.2/Harvest-Linux64-v1.1.2.tar.gz
RUN tar -xvf Harvest-Linux64-v1.1.2.tar.gz
RUN mkdir /scripts && mkdir /home/ubuntu/.config && mkdir /home/ubuntu/.config/autostart
# ADD /scripts/* /scripts/
# ADD /autostarts/.desktop /home/ubuntu/.config/autostart/.desktop
# RUN chmod +x /scripts/* && ln -s /scripts/* /usr/local/bin/

VOLUME /Coursedata
