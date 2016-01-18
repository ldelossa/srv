rabbitmq:
  version: '3.5.6'
  users:
    tmpchq_user:
      password: RvdeXurQ
      vhost: 
        - tmpchq:
        - tmpchq_test:
      permission_config: '".*"'
      permission_write: '".*"'
      permission_read: '".*"'
  vhosts:
    tmpchq:
      - user: tmpchq_user
        permission: '".*" ".*" ".*"'
