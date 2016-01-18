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
    - gcc
    - gcc-c++
    - m4
    - ncurses-devel
    - autoconf
    - java-1.8.0-openjdk-devel
    - openssl-devel
    - make
    - zlib
    {% if grains['os_family'] == 'RedHat' %}
    - yum-utils
    {% endif %}
  remove:
    - postfix
    - NetworkManager
