rabbitmq:
  version: '3.5.6'
  users:
    tmpchq_user:
      password: RvdeXurQ
  vhosts:
    tmpchq:
      - user: tmpchq_user
        permission: '".*" ".*" ".*"'  
