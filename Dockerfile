FROM golang

ENV CONSUL_VERSION=1.6.1
ENV GLIDE_VERSION=0.13.3

RUN  apt-get update \
     && apt-get install -y unzip \
     && go get golang.org/x/lint/golint  \
     && curl -Lo /tmp/glide.tgz "https://github.com/Masterminds/glide/releases/download/v${GLIDE_VERSION}/glide-v${GLIDE_VERSION}-linux-amd64.tar.gz" \
     && tar -C /usr/bin -xzf /tmp/glide.tgz --strip=1 linux-amd64/glide \
     && curl --fail -Lso consul.zip "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" \
     && unzip consul.zip -d /usr/bin

ENV CGO_ENABLED 0
ENV GOPATH /go:/cp
