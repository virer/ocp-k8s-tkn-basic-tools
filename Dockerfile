FROM alpine:3.13

RUN apk add --no-cache curl bash

TKN_VERSIOn="0.17.0"
OCP_VERSION="4.6.22"
# K8S_VERSION="1.19.1"

RUN curl -LO "https://github.com/tektoncd/cli/releases/download/v${TKN_VERSION}/tkn_${TKN_VERSION}_Linux_x86_64.tar.gz"
RUN curl -LO "https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/${OCP_VERSION}/openshift-client-linux.tar.gz"
# kubectl included with oc cli RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/v${K8S_VERSION}/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl

RUN tar xzf "tkn_${TKN_VERSION}_Linux_x86_64.tar.gz" -C /usr/local/bin/
RUN tar xzf "openshift-client-linux.tar.gz" -C /usr/local/bin/

RUN chmod +x /usr/local/bin/kubectl /usr/local/bin/tkn /usr/local/bin/oc
