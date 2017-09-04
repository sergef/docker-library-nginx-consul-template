#!/bin/sh

nginx -g "daemon off;" \
& consul-template \
	-consul-addr $CONSUL_HOST \
	-template "/etc/nginx/nginx.ctmpl:/etc/nginx/nginx.conf:nginx -s reload"
