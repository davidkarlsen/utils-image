FROM ubuntu:latest
RUN apt update \
  && apt -y install software-properties-common curl \
  && add-apt-repository ppa:rmescandon/yq \
  && cd /usr/local/bin && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod a+x kubectl \
  && apt update \
  && apt -y install yq jq curl \
  && apt -y clean \
  && rm -rf /var/lib/apt/lists/*

#b0rken: https://github.com/kubernetes/release/issues/3219
#&& curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | apt-key add - \
#&& add-apt-repository https://pkgs.k8s.io/core:/stable:/v1.28/deb/ \
