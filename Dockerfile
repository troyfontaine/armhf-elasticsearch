
############################################################
# Dockerfile to build ARMhf ElasticSearch Containers
# Based on armv7/armhf-ubuntu
############################################################

FROM armv7/armhf-ubuntu

MAINTAINER troyfontaine

# Update the repository and install tools
RUN \ 
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && apt-get update && apt-get upgrade -y && apt-get install oracle-java8-installer && wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.deb && dpkg -i elasticsearch-1.5.2.deb && update-rc.d elasticsearch defaults 95 10 && sudo /etc/init.d/elasticsearch start

# Set the default command to execute when creating a new container
CMD ["elasticsearch"]

# Expose Ports
EXPOSE 9200