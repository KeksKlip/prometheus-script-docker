# Prometheus script in Docker

Docker-контейнер для сборки прошивок роутеров с помощью скрипта [Prometheus](http://prometheus.freize.net). Необходим [Docker](https://docs.docker.com/engine/install).

## Сборка образа

Собрать образ `prometheus` (имя произвольно):
```sh
docker build -t prometheus 'https://github.com/shvchk/prometheus-script-docker.git#main'
```
Впоследствии на базе него будут создаваться контейнеры. Сборка производится однократно, в дальнейшем повторять её не требуется, если вы не решите изменить Dockerfile.

## Создание, запуск и работа с контейнерами

- **Создать и запустить новый контейнер `prometheus-1` (имя произвольно) из образа `prometheus`:**
  ```sh
  docker run -it --name prometheus-1 prometheus
  ```
  При запуске контейнера в нём автоматически запустится Prometheus. Далее — стандартная работа с Prometheus. Когда вы закончите работу и выйдите из Prometheus, контейнер будет автоматически остановлен, данные в нём сохранятся.

- **Повторно запустить контейнер после его остановки:**
  ```sh
  docker start -ai prometheus-1
  ```

- **Подключиться к терминалу запущенного контейнера:**
  ```sh
  docker exec -it prometheus-1 bash
  ```

- **Создать новый контейнер `prometheus-2` из того же образа:**
  ```sh
  docker run -it --name prometheus-2 prometheus
  ```
  Контейнеры не связаны между собой, каждый имеет своё хранилище.

- **Удалить контейнер `prometheus-2`:**
  ```sh
  docker container rm prometheus-2
  ```

- **Создать новый одноразовый контейнер:**
  ```sh
  docker run --rm -it --name prometheus-3 prometheus
  ```
  Такой контейнер будет автоматически удалён после выхода из него.

- **Создать новый контейнер, разместив папку Prometheus в `/tmp/prometheus` на хосте:**
  ```sh
  docker run -it -v /tmp/prometheus:/opt/prometheus --name prometheus-4 prometheus bash
  ```
  Это бывает полезно, чтобы сделать папку Prometheus легко доступной на хосте (например, чтобы изменить какие-то файлы или забрать собранные файлы) или чтобы разместить папку Prometheus в ФС в RAM / ZRAM для ускорения сборки.

  Заметьте, что в примере выше стартовая команда заменена со стандартной на шелл `bash`. Дело в том, что если в соответствующей папке на хосте нет скрипта Prometheus (`start.sh`), контейнер не сможет его запустить. Поэтому вместо скрипта запускаем шелл, чтобы вручную скачать и запустить скрипт:
  ```sh
  wget -O "$APP_LAUNCHER_NAME" "$APP_URL" && \
  chmod +x "$APP_LAUNCHER_NAME" && \
  ./"$APP_LAUNCHER_NAME"
  ```

  Если в соответствующей папке на хосте у вас уже есть скрипт Prometheus, абзац выше можно игнорировать, и просто убрать `bash` из команды запуска контейнера выше, чтобы Prometheus запустился автоматически.
