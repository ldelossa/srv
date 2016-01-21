install_phpipam:
  archive.extracted:
    - name: /var/www/html/
    - source: salt://files/phpipam/phpipam-1.1.010.tar
    - archive_format: tar
    - tar_options: --strip 1
    - if_missing: /var/www/html/phpipam/

configure_services:
  service.running:
    - name: mariadb
    - enable: True
    - name: httpd
    - enable: true
