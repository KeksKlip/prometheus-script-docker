FROM  debian:stable-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
	wget sudo netcat cpio kmod cmake\
	&& mkdir /opt/prometheus \
	&& wget -O /opt/prometheus/start.sh http://prometheus.freize.net/script/start-99.sh \ 
	&& chmod +x /opt/prometheus/start.sh
WORKDIR /opt/prometheus
ENTRYPOINT ["/opt/prometheus/start.sh"]
