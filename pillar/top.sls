base:
  '*':
    - core.packages
    - core.common
  '*haraka*':
    - haraka.common
    - haraka.open_ports
    - haraka.packages
    - haraka.users
  '*redis*':
    - redis.open_ports
    - redis.common
  '*jenkins*':
    - jenkins.common
    - jenkins.packages
