open_ports:
  {% if grains['os_family'] == 'RedHat' and grains['osmajorrelease'] >= 7 %}
  firewalld.present:
    - name: public
    - ports:
      {% for port, proto in pillar.get('open_ports', {}).items() %}
      - {{ port }}/{{ proto }}
      {% endfor %}
  {% else %}
  {% for port, proto in pillar.get('open_ports', {}).items() %}
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: {{ port }}
    - proto: {{ proto }}
    - sport: 1025:65535
    - save: True
  {% endfor %}
  {% endif %}
