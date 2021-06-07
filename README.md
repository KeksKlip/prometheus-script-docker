# prometheus-script-docker
Docker контейнер для замены виртуальных машин для запуска Prometheus скрипта для сборки прошивок (http://prometheus.freize.net/).

Для запуска должен быть установлен Docker Descktop  https://www.docker.com/products/docker-desktop

## Сборка образа
Скачайте Dockerfile и в директории, где вы его сохранили выполните команду:  
```bash
docker build -t prometheus .
```
Она соберет образ (image), из которого можно будет запустить контейнер для сборки прошивки.

## Запуск контейнера
Выполоните команду:
```bash
docker run -it prometheus
```
Запустится контейнер, и скрипт Prometheus.

Далее - стандартная работа с Prometheus.
