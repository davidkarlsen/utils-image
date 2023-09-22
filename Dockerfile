FROM ubuntu:latest
RUN apt update \
  && apt -y install software-properties-common curl \
  && add-apt-repository ppa:rmescandon/yq \
  && curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | apt-key add - \
  && add-apt-repository https://pkgs.k8s.io/core:/stable:/v1.28/deb/ \
  && apt update \
  && apt -y install kubectl yq jq curl \
  && rm -rf /var/lib/apt/lists/*
