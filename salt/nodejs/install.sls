{% set VER = salt['pillar.get']('node_version') %}

get_node:
  file.managed:
    - name: /tmp/node-{{ VER }}.tar.gz
    - source: https://nodejs.org/dist/{{ VER }}/node-{{ VER }}.tar.gz
    - source_hash: https://nodejs.org/dist/{{ VER }}/SHASUMS.txt
    - unless: which node

compile_node:
  cmd.run:
    - name: |
        cd /tmp/
        tar xzf node-{{ VER }}.tar.gz
        cd node-{{ VER }}
        ./configure
        make
        make install
    - shell: /bin/bash
    - unless: which node
    - requre:
      - sls: get_node
