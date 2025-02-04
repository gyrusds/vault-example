FROM ubuntu:20.04
RUN apt-get update && apt-get install --fix-missing -y software-properties-common curl gnupg2 
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt-get update && apt-get install -y \
  vault && \
  setcap cap_ipc_lock= /usr/bin/vault

COPY run.sh ./
CMD ./run.sh
