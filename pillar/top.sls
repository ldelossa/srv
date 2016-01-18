base:
  '*':
    - core.packages
    - core.open_ports
  '*haraka*':
    - haraka.common
    - haraka.open_ports
    - haraka.packages
    - haraka.users
  '*redis*':
    - redis.open_ports
    - redis.common
