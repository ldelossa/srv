{% set VER = salt['pillar.get']('erlang_version') %}

get_erlang:
  file.managed:
    - name: /tmp/otp_src_{{ VER }}.tar.gz
    - source: http://erlang.org/download/otp_src_{{ VER }}.tar.gz
    - source_hash: http://www.erlang.org/download/MD5
    - unless: which erl

compile_erlang:
  cmd.run:
    - name: |
        cd /tmp/
        tar xzf otp_src_{{ VER }}.tar.gz
        cd otp_src_{{ VER }}
        ./otp_build autoconf
        ./configure && make && make install
    - shell: /bin/bash
    - env:
      - HOME: '/root/'
    - check_cmd:
      - which erl
    - unless: which erl
    - require:
      - file: /tmp/otp_src_{{ VER }}.tar.gz
