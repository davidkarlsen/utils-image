FROM ubuntu:latest
RUN apt update \
  && apt -y install software-properties-common \
  && add-apt-repository ppa:rmescandon/yq \
  && apt -y install kubectl yq jq curl
