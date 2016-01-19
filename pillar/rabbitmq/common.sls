rabbitmq:
  version: '3.5.6'
  users:
    vhost1_user:
      password: vhost1_pass
  vhosts:
    vhost1:
      - user: vhost1_user
        permission: '".*" ".*" ".*"'
