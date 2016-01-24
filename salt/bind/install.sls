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
    - name: /var/named/kvm.lan.zone
    - force: True

enable_bind:
  service.running:
    - name: named
    - enabled: True
    - reload: True
    - watch:
      - file: /etc/named.conf
      - file: /var/named/kvm.lan.zone
