{% set VER = salt['pillar.get']('erlang:erlang_version') %}
{% set erlang_package = salt['pillar.get']('erlang:erlang_package') %}

install_erlang_package:
  pkg.installed:
    - sources:
      - erlang-{{ VER }}: {{ erlang_package }}
    - unless: which erl
    - check_cmd:
      - which erl 



