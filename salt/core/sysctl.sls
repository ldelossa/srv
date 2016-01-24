{% from "core/map.jinja" import sysctl with context %}

copy.sysctl-conf:
  file.managed:
    - name: {{ sysctl.sysctl_config_file_path }}
    - source:
      - {{ sysctl.sysctl_config_file }}
    - source_hash: md5=b9db19fd4b77178110b6dee3ea90bc4d
    - user: root
    - group: root
    - mode: 0755


restart.sysctl:
  cmd.run:
    - name: sysctl -p /etc/sysctl.conf
    - requires:
      - file: {{ sysctl.sysctl_config_file_path }}
    - onchanges:
      - file: {{ sysctl.sysctl_config_file_path }}
