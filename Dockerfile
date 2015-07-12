FROM       ubuntu:latest
MAINTAINER sl@test.com

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# Update apt-get sources AND install MongoDB
RUN apt-get update && apt-get install -y mongodb-org

#Tip: You can install a specific version of MongoDB by using a list of required packages with versions, e.g.:
RUN apt-get update && apt-get install -y mongodb-org=3.0.1 mongodb-org-server=3.0.4 mongodb-org-shell=3.0.4 mongodb-org-mongos=3.0.4 mongodb-org-tools=3.0.4

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Expose port 27017 from the container to the host
EXPOSE 27017

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod"]
