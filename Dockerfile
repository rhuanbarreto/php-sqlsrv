FROM php:7.0-apache

EXPOSE 2222

MAINTAINER easySubsea <contact@easysubsea.com>

# Install SQL Server Extension
RUN apt-get update && apt-get install -y unixodbc-dev
RUN pecl install sqlsrv pdo_sqlsrv
RUN echo "extension=sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`
RUN echo "extension=pdo_sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`

# Setup SSH
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update && apt-get install -y --no-install-recommends dialog && apt-get update && apt-get install -y --no-install-recommends openssh-server && echo "$SSH_PASSWD" | chpasswd
COPY sshd_config /etc/ssh/
RUN service ssh start
