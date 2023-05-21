FROM alpine:3.14
RUN apk update && apk add --no-cache nginx mysql php8 php8-fpm php8-opcache php8-gd php8-zlib php8-curl php8-mysqlnd php8-mysqli
COPY default.conf /etc/nginx/http.d/default.conf 
COPY index.php /var/www/localhost/index.php
EXPOSE 80
EXPOSE 443
#ENTRYPOINT ["nginx"]
#CMD ["-g", "daemon off;"]

CMD ["/bin/sh", "-c", "php-fpm8 && chown root:www-data /var/www/localhost/index.php && chmod 755 /var/www/localhost/index.php && nginx -g 'daemon off;'"]