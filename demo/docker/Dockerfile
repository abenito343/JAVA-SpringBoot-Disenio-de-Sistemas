MAINTAINER baeldung.com

RUN chown -R mysql:root /var/lib/mysql/

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=DDS
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root
ENV MYSQL_ROOT_PASSWORD=root

ADD data.sql /etc/mysql/data.sql

RUN sed -i 's/MYSQL_DATABASE/'DDS'/g' /etc/mysql/data.sql
RUN cp /etc/mysql/data.sql /docker-entrypoint-initdb.d

EXPOSE 3306