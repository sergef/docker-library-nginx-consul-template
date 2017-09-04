FROM sergef/docker-library-nginx:1.12.1.2

ENV VERSION 0.19.2
ENV FILENAME consul-template_${VERSION}_linux_amd64.tgz
ENV SHA256SUM "f92f2abbdc034b9797c2ea7561c8fb95234ee97d4d6c5c0a1f96380c036c962c  /tmp/downloads/${FILENAME}"

ADD https://releases.hashicorp.com/consul-template/${VERSION}/${FILENAME} /tmp/downloads/

RUN ls /tmp/downloads \
  && sha256sum < /tmp/downloads/${FILENAME} \
  && echo $SHA256SUM | sha256sum -c -
