packages:
  install:
{% if grains['os_family'] == 'RedHat' %}
    httpd:
    mariadb-server:
    mariadb:
    php:
    php-mysql:
    php-ldap:
    php-mcrypt:
    php-pear:
{% endif %}
{% if grains['os_family'] == 'Debian' %}
    apache2:
    mariadb-server:
    mariadb-client:
    php5:
    php5-mysql:
    php5-ldap:
    php5-mcrypt:
    php-pear:
{% endif %}
