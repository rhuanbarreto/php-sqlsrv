FROM php:7.0

MAINTAINER easySubsea <contact@easysubsea.com>

# Install SQL Server Extension
RUN apt-get update && apt-get install -y unixodbc-dev
RUN pecl install sqlsrv pdo_sqlsrv
RUN echo "extension=sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`
RUN echo "extension=pdo_sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`
