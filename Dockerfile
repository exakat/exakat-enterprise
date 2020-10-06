FROM php:7.4-cli-buster

COPY exakatClient.php /usr/src/exakat/

WORKDIR /usr/src/exakat

ENTRYPOINT ["php", "/usr/src/exakat/exakatClient.php"]
