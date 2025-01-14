FROM debian:10-slim

ENV APP_PATH="/opt/prometheus" \
    APP_LAUNCHER_NAME="start.sh" \
    APP_URL="https://pm.freize.net/script/start-99.sh" \
    LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

RUN apt update && \
    apt upgrade -y && \
    apt install -y cmake cpio kmod locales netcat sudo wget && \
    sed -Ei '/(en_US|ru_RU).UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen && \
    mkdir "${APP_PATH}" && \
    wget -O "${APP_PATH}/${APP_LAUNCHER_NAME}" "${APP_URL}" && \
    chmod +x "${APP_PATH}/${APP_LAUNCHER_NAME}"

WORKDIR "${APP_PATH}"

CMD "${APP_PATH}/${APP_LAUNCHER_NAME}"
