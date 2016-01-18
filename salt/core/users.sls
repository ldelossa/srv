{% if salt['pillar.get']('users') %}
{% for user, items in salt['pillar.get']('users', {}).items() %}
create_user:
  user.present:
    - name: {{ user }}
    - fullname: {{ items['fullname'] }}
    - password: {{ items['password'] }}
{% endfor %}
{% endif %}
