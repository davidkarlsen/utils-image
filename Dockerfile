FROM ubuntu:jammy-20231128
RUN apt update \
  && apt -y install software-properties-common curl \
  && add-apt-repository ppa:rmescandon/yq \
  && cd /usr/local/bin && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod a+x kubectl \
  && apt update \
  && apt -y install jq curl \
  && apt -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && curl --silent -L https://github.com/mikefarah/yq/releases/download/v4.35.2/yq_linux_amd64 -o /usr/local/bin/yq \
  && chmod a+x /usr/local/bin/yq

#b0rken: https://github.com/kubernetes/release/issues/3219
#&& curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | apt-key add - \
#&& add-apt-repository https://pkgs.k8s.io/core:/stable:/v1.28/deb/ \
