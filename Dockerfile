FROM amazon/aws-cli:2.2.7
MAINTAINER Yuqiang Huang <cvw643@outlook.com>

ENV K8S_VERSION=v1.20.4
ENV HELM_VERSION=v3.6.0

RUN yum install -y tar \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64
 
ENTRYPOINT [ "helm" ]
