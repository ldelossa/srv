install_bind:
  pkg.installed:
    - name: bind
  file.managed:
    - source: salt://files/bind/named.conf
    - name: /etc/named.conf
    - force: True

configure_zone:
  file.managed:
    - source: salt://files/bind/kvm.lan.zone
    - name: /var/named/db.kvm.lan
    - force: True

enable_bind:
  service.running:
    - name: named
    - reload: True
    - watch:
      - file: /etc/named.conf
      - file: /var/named/db.kvm.lan
