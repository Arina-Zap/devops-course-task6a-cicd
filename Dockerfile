FROM alpine:3.14.3

RUN apk --no-cache add apache2 php8-apache2
RUN rm -f /var/www/localhost/htdocs/index.html
COPY app/index.php /var/www/localhost/htdocs/index.php

CMD ["httpd", "-DFOREGROUND"]
EXPOSE 80
