FROM sergef/docker-library-nginx:1.12.1.2

ENV VERSION 0.19.2
ENV FILENAME consul-template_${VERSION}_linux_amd64.tgz
ENV SHA256SUM f92f2abbdc034b9797c2ea7561c8fb95234ee97d4d6c5c0a1f96380c036c962c

ENV CONSUL_HOST consul

COPY etc/nginx /etc/nginx
COPY entrypoint.sh /entrypoint.sh

ADD https://releases.hashicorp.com/consul-template/${VERSION}/${FILENAME} /tmp/downloads/

RUN ls /tmp/downloads \
  && echo "${SHA256SUM}  /tmp/downloads/${FILENAME}" | sha256sum -c - \
  && tar -xvf /tmp/downloads/${FILENAME} -C /bin \
  && chmod +x /bin/consul-template \
  && chmod +x /entrypoint.sh \
  && rm -rf /tmp/downloads

ENTRYPOINT ["tini", "--", "/entrypoint.sh"]
