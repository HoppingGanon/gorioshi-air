FROM debian:stable-20230202

# prepare apps
RUN apt-get update -y
RUN apt-get install wget -y

# make folders
RUN mkdir /develop
RUN mkdir /develop/app
RUN mkdir /root/go
RUN mkdir /root/temp

# add scripts
ADD ./entrypoint.sh /develop/script/go/entrypoint.sh
ADD ./run.sh /develop/script/go/run.sh
ADD ./kill.sh /develop/script/go/kill.sh

# change directory
WORKDIR /root/temp

# download go archive
RUN wget https://go.dev/dl/go1.20.linux-amd64.tar.gz
RUN tar -xvf go1.20.linux-amd64.tar.gz -C /develop/app
RUN rm go1.20.linux-amd64.tar.gz

# set environmental variables
RUN export PATH=$PATH:/develop/app/go/bin
RUN export GOPATH=/root/go/bin
RUN export PATH=$PATH:/root/go/bin
RUN echo "export PATH=\$PATH:/develop/app/go/bin" >> /root/.profile
RUN echo "export GOPATH=/root/go" >> /root/.profile
RUN echo "export PATH=\$PATH:/root/go/bin" >> /root/.profile

# install air
RUN /develop/app/go/bin/go install github.com/cosmtrek/air@v1.41.0

# remove cache
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# change directory
WORKDIR /root/src/go

# serve listener
ENTRYPOINT ["bash", "/develop/script/go/entrypoint.sh"]
