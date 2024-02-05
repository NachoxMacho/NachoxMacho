FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install -y software-properties-common curl git build-essential wget

RUN apt update
RUN apt install software-properties-common
RUN add-apt-repository --yes ppa:ansible/ansible
RUN apt install ansible -y
RUN apt clean autoclean
RUN apt autoremove -y

FROM base AS nachoxmacho
ARG TAGS
RUN addgroup --gid 1000 nachoxmacho
RUN adduser --gecos nachoxmacho --uid 1000 --gid 1000 --disabled-password nachoxmacho
# USER nachoxmacho
WORKDIR /home/nachoxmacho/personal/nachoxmacho

FROM nachoxmacho
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS ./local.yml"]
