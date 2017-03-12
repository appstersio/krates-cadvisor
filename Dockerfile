FROM alpine:3.5

ENV GOPATH=/go \
    CADVISOR_VERSION=0.24.1
RUN apk --no-cache add ca-certificates device-mapper
RUN apk --update --no-cache add --virtual build-dependencies go gcc g++ make git linux-headers bash && \
    git clone https://github.com/google/cadvisor /go/src/github.com/google/cadvisor && \
    cd /go/src/github.com/google/cadvisor && \
    git checkout v${CADVISOR_VERSION} && \
    make build && \
    cp ./cadvisor /usr/bin/cadvisor && \
    apk del build-dependencies && \
    rm -rf /go && rm -rf /var/cache/apk/*

EXPOSE 8080
ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
