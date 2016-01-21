base:
  'kernel:Linux':
    - match: grain
    - core.packages
    - core.ssh
    - core.open_ports
    - core.sysctl
    - core.python34
    - core.stash_keys
    - core.users
  '*haraka*':
    - haraka.install
  '*redis*':
    - redis.install
  '*jenkins*':
    - jenkins.install
  '*ipamtest*':
    - phpipam.install
