{% from "core/map.jinja" import ssh with context %}

copy.sshd_config:
  file.managed:
    - name: {{ ssh.sshd_config_file_path }}
    - source:
      - {{ ssh.sshd_config_file }}
    - source_hash: md5=d0e99341d00ec954738f35e5cc29b9fc
    - user: root
    - group: root
    - mode: 0755

copy.ssh_config:
  file.managed:
    - name: {{ ssh.ssh_config_file_path }}
    - source:
      - {{ ssh.ssh_config_file }}
    - user: root
    - group: root
    - mode: 0755

copy.authorized_keys:
  file.managed:
    - name: {{ ssh.authorized_keys_file_path }}
    - source:
      - {{ ssh.authorized_keys_file }}
    - source_hash: md5=963a08b6fc8225a4ac8b1e1319c83945
    - user: root
    - group: root
    - mode: 0600
    - makedirs: True
    - dir_mode: 0700

copy.banner:
  file.managed:
    - name: {{ ssh.banner_file_path }}
    - source:
      - {{ ssh.banner_file }}
    - source_hash: md5=f078fe086dfc22f64b5dca2e1b95de2c
    - user: root
    - group: root
    - mode: 0755

sshd.running:
  service.running:
  - name: sshd
  - enable: True
  - reload: True
  - watch:
    - file: {{ ssh.sshd_config_file_path }}
