FROM ubuntu:noble-20251013
RUN apt update \
  && apt -y install curl jq rsync keyutils easy-rsa \
  && cd /usr/local/bin && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod a+x kubectl \
  && curl --silent -L https://github.com/Azure/azure-storage-azcopy/releases/download/v10.30.0/azcopy-10.30.0.x86_64.deb -o /tmp/azcopy.dpkg && dpkg -i /tmp/azcopy.dpkg && rm /tmp/azcopy.dpkg \
  && curl --silent -L https://github.com/mikefarah/yq/releases/download/v4.50.1/yq_linux_amd64 -o /usr/local/bin/yq \
  && chmod a+x /usr/local/bin/yq \
  && curl -kLso /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-4.20/openshift-client-linux.tar.gz && tar -xzf /tmp/oc.tar.gz -C /usr/local/bin oc && rm /tmp/oc.tar.gz \
  && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash \
  && curl -sL https://aka.ms/InstallAzureCLIDeb | bash \
  && apt -y clean \
  && rm -rf /var/lib/apt/lists/*
