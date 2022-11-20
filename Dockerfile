FROM ubuntu:22.10

ENV PATH=$PATH:/home/subdomains/go/bin:/home/subdomains/.local/bin

RUN apt update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -qq -y install tzdata sudo wget curl git make gcc unzip

RUN echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-passwordless \
        && useradd subdomains && adduser subdomains sudo \
        && mkdir /home/subdomains && chown -R subdomains: /home/subdomains

WORKDIR /home/subdomains

ADD . /home/subdomains/

USER subdomains
RUN sudo chmod 755 ./*.sh
RUN bash -c ./install.sh

ENTRYPOINT ["/home/subdomains/subdomains.sh"]
CMD ["-h"]
