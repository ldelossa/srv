base:
  'kernel:Linux':
    - match: grain
    - core.packages
    - core.ssh
    - core.open_ports
    - core.sysctl
    - core.python34
    - core.users
  'dns*':
    - bind.install
  'jenkins*':
    - jenkins.install
  'dockerhost*':
    - dockerhost.install
