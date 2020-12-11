FROM php:7.4.11-cli
MAINTAINER Elad Bar <elad.bar@hotmail.com>

WORKDIR /app

COPY *.php ./

RUN apt-get -y update
RUN apt-get -y install libmosquitto-dev
RUN pecl install Mosquitto-beta
RUN docker-php-ext-enable mosquitto


ENV DAHUA_VTO_HOST=vto-host
ENV DAHUA_VTO_USERNAME=Username
ENV DAHUA_VTO_PASSWORD=Password
ENV MQTT_BROKER_HOST=mqtt-host
ENV MQTT_BROKER_PORT=1883
ENV MQTT_BROKER_USERNAME=Username
ENV MQTT_BROKER_PASSWORD=Password
ENV MQTT_BROKER_TOPIC_PREFIX=DahuaVTO

CMD php -f /app/DahuaVTO.php