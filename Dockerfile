FROM ubuntu:latest
RUN apt update \
  && apt -y install software-properties-common \
  && add-apt-repository ppa:rmescandon/yq \
  && add-apt-repository https://pkgs.k8s.io/core:/stable:/v1.28/deb/ \
  && apt -y install kubectl yq jq curl
