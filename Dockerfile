FROM debian:10-slim
RUN apt update && \
    apt upgrade -y && \
    apt install -y cmake cpio kmod netcat sudo wget && \
    mkdir /opt/prometheus && \
    wget -O /opt/prometheus/start.sh http://prometheus.freize.net/script/start-99.sh && \
    chmod +x /opt/prometheus/start.sh
WORKDIR /opt/prometheus
ENTRYPOINT ["/opt/prometheus/start.sh"]
