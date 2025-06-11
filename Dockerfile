FROM ubuntu:noble-20250529
RUN apt update \
  && apt -y install curl \
  && cd /usr/local/bin && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod a+x kubectl \
  && apt -y install jq rsync \
  && apt -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && curl --silent -L https://github.com/mikefarah/yq/releases/download/v4.45.4/yq_linux_amd64 -o /usr/local/bin/yq \
  && chmod a+x /usr/local/bin/yq \
  && curl -kLso /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-4.18/openshift-client-linux.tar.gz && tar -xzf /tmp/oc.tar.gz -C /usr/local/bin oc \
  && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
