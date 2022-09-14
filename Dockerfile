FROM ubuntu:22.04
ENV TZ=Europe/Kiev
RUN apt-get update && apt-get install apache2 -y && apt-get install apache2-utils -y && apt-get clean && a2enmod headers && a2enmod expires && export DEBIAN_FRONTEND=noninteractive && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && echo "ServerName localhost" >> /etc/apache2/apache2.conf && apt-get install libapache2-mod-php php-mysql php-curl php-gd php-mail php-pgsql -y &&rm -rf /var/www/html/index.html
COPY ./index.php /var/www/html/index.php
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
