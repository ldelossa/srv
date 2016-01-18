{% set VER = salt['pillar.get']('rabbitmq:version') %}
{% set HOSTNAME = grains['host'] %}

install_rabbitmq_package:
  pkg.installed:
    - sources:
      - rabbitmq: https://www.rabbitmq.com/releases/rabbitmq-server/v{{ VER }}/rabbitmq-server-{{ VER }}-1.noarch.rpm 
    - unless: which rabbitmqctl
    - check_cmd:
      - which rabbitmq-server
  
rabbitmq_service:
  service.running:
    - name: rabbitmq-server
    - enable: True 

rabbitmq_plugins:
  rabbitmq_plugin.enabled:
    - name: rabbitmq_management

{% for user, items in salt['pillar.get']('rabbitmq:users', {}).items() %}
rabbit_user_{{ user }}:
  rabbitmq_user.present:
    - name: {{ user }}
    - password: {{ items['password'] }}
{% endfor %}

{% for vhost, items in salt['pillar.get']('rabbitmq:vhosts', {}).items() %}
rabbit_vhost_{{ vhost }}:
  rabbitmq_vhost.present:
    - name: {{ vhost }}
{% endfor %}

{% for vhost, items in salt['pillar.get']('rabbitmq:vhosts', {}).items() %}
{% for item in items %}
rabbitmq_set_permissions:
  cmd.run:
    - name: | 
        rabbitmqctl set_permissions -p {{ vhost }} {{ item['user'] }} {{ item['permission'] }}
    - cwd: '/' 
  {% endfor %}
{% endfor %}
