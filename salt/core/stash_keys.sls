{% from "core/map.jinja" import stash_keys with context %}

install_stash_keys:
  file.managed:
    - name: {{ stash_keys.private_path }}
    - source:
      - {{ stash_keys.private }}
    - user: root
    - group: root
    - mode: 0600
    - makedirs: True
