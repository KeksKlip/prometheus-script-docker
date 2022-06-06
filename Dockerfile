FROM debian:10-slim

ENV APP_PATH="/opt/prometheus" \
    APP_LAUNCHER_NAME="start.sh" \
    APP_URL="http://prometheus.freize.net/script/start-99.sh"

RUN apt update && \
    apt upgrade -y && \
    apt install -y cmake cpio kmod netcat sudo wget && \
    mkdir "${APP_PATH}" && \
    wget -O "${APP_PATH}/${APP_LAUNCHER_NAME}" "${APP_URL}" && \
    chmod +x "${APP_PATH}/${APP_LAUNCHER_NAME}"

WORKDIR "${APP_PATH}"

CMD "${APP_PATH}/${APP_LAUNCHER_NAME}"
