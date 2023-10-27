# Dockerfile for variant-calling

# start with Ubuntu
FROM ubuntu
#--platform=linux/amd64 ubuntu bash
# install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    nano \
    openssl
    
# install packages
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN mkdir /root/miniconda3
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -u -p root/miniconda3
RUN ~/miniconda3/bin/conda init bash
RUN rm /Miniconda3-latest-Linux-x86_64.sh
#install software
RUN ~/miniconda3/bin/conda install -c bioconda fastqc -y
RUN ~/miniconda3/bin/conda install -c bioconda trimmomatic -y
RUN ~/miniconda3/bin/conda install -c bioconda bwa -y
#RUN ~/miniconda3/bin/conda install -c bioconda samtools -y
#RUN ~/miniconda3/bin/conda install -c bioconda bcftools -y


# start with bash
CMD ["/bin/sh", "-c", "exec bash"]

# To get into the docker container again
# RUN docker exec -it name-of-container bash

#from alterante computer to start a new container with same set up
#docker build -t (imagename) . where the . is the location of the Dockerfile





