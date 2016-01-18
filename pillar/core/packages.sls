packages:
  install:
    {% if grains['virtual'] != none %}
    - open-vm-tools
    {% endif %}
    - lsof
    - tcpdump
    - mtr
    - traceroute
    - telnet
    - bind-utils
    - curl
    - wget
    - ftp
    - tftp
    - samba
    - samba-client
    - ntp
    - git
    - gcc-c++
    - gcc
    - zlib
    {% if grains['os_family'] == 'RedHat' %}
    - yum-utils
    {% endif %}
  remove:
    - postfix
    - NetworkManager
