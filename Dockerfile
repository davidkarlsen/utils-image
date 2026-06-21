FROM ubuntu:noble-20260410
# azure-cli Suites is hardcoded to "noble" rather than $(lsb_release -cs):
# the packages.microsoft.com/repos/azure-cli repo only publishes per-codename
# suites and has no distro-agnostic (stable/lts) suite. It currently has no
# suite for newer releases (e.g. resolute/26.04), so a dynamic codename would
# 404. The az package is distro-independent, so the latest available suite
# (noble) works on newer bases too. Bump to a newer suite once MS publishes one.
RUN apt update \
  && apt -y install ca-certificates curl apt-transport-https lsb-release gnupg jq rsync keyutils easy-rsa \
  && curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | install -m 0644 /dev/stdin /etc/apt/keyrings/microsoft.gpg \
  && echo "Types: deb\nURIs: https://packages.microsoft.com/repos/azure-cli/\nSuites: noble\nComponents: main\nSigned-By: /etc/apt/keyrings/microsoft.gpg" | install -m 0644 /dev/stdin /etc/apt/sources.list.d/azure-cli.sources \
  && apt update \
  && apt -y install azure-cli \
  && cd /usr/local/bin && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod a+x kubectl \
  && curl --silent -L https://github.com/Azure/azure-storage-azcopy/releases/download/v10.32.4/azcopy-10.32.4.x86_64.deb -o /tmp/azcopy.dpkg && dpkg -i /tmp/azcopy.dpkg && rm /tmp/azcopy.dpkg \
  && curl --silent -L https://github.com/mikefarah/yq/releases/download/v4.53.3/yq_linux_amd64 -o /usr/local/bin/yq \
  && chmod a+x /usr/local/bin/yq \
  && curl -kLso /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-4.22/openshift-client-linux.tar.gz && tar -xzf /tmp/oc.tar.gz -C /usr/local/bin oc && rm /tmp/oc.tar.gz \
  && curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4 | bash \
  && apt -y clean \
  && rm -rf /var/lib/apt/lists/*
