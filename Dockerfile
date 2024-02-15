FROM ubuntu:jammy-20240125
RUN apt update \
  && apt -y install software-properties-common curl \
  && add-apt-repository ppa:rmescandon/yq \
  && cd /usr/local/bin && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod a+x kubectl \
  && apt update \
  && apt -y install jq curl rsync \
  && apt -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && curl --silent -L https://github.com/mikefarah/yq/releases/download/v4.40.7/yq_linux_amd64 -o /usr/local/bin/yq \
  && chmod a+x /usr/local/bin/yq \
  && curl -kLso /tmp/azcopy_v10.tar.gz https://aka.ms/downloadazcopy-v10-linux && tar -xzf /tmp/azcopy_v10.tar.gz --strip-components=1 -C /usr/local/bin && chmod a+x /usr/local/bin/azcopy && rm /tmp/azcopy_v10.tar.gz \
  && curl -kLso /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-4.14/openshift-client-linux.tar.gz && tar -xzf /tmp/oc.tar.gz -C /usr/local/bin oc \
  && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

#b0rken: https://github.com/kubernetes/release/issues/3219
#&& curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | apt-key add - \
#&& add-apt-repository https://pkgs.k8s.io/core:/stable:/v1.28/deb/ \
