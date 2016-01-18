{% set VER = salt['pillar.get']('rabbitmq:version', {}) %}
{% set HOSTNAME = grains['host'] %}

install_rabbitmq_package:
  pkg.installed:
    - sources:
      - rabbitmq: https://www.rabbitmq.com/releases/rabbitmq-server/v{{ VER }}/rabbitmq-server-{{ VER }}-1.noarch.rpm 
    - unless: which rabbitmqctl
    - check_cmd:
      - which rabbitmq-server
  
enable_managment:
  cmd.run:
    - name: rabbitmq-plugins enable rabbitmq_management
    - cwd: /
    - env:
      - HOME: /root/
    - shell: /bin/bash

rabbitmq_service:
  service.running:
    - name: rabbitmq-server
    - enable: True 

{% for user, items in salt['pillar.get']('rabbitmq:users').items() %}
rabbitmq_user_{{ user }}:
  rabbitmq_user.present:
    - name: {{ user }}
    - password: {{ items['password'] }}
    - perms:
      {% for vhost in items['vhost'] %}
      - {{ vhost }}
        - {{ items['permission_config'] }}
        - {{ items['permission_write'] }}
        - {{ items['permission_read'] }}
      {% endfor %}
{% endfor %}
