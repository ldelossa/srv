tmq:
  version: "3.5.3-1"
  plugin:
    rabbitmq_management:
      - enabled
  policy:
    rabbitmq_policy:
      - name: HA
      - pattern: '.*'
      - definition: '{"ha-mode": "all"}'
  vhost:
    virtual_host:
      - owner: rabbit_user
      - conf: .*
      - write: .*
      - read: .*
  user:
    user1:
      - password: password
      - force: True
      - tags: monitoring, user
      - perms:
        - '/':
          - '.*'
          - '.*'
          - '.*'
      - runas: root
    user2:
      - password: password
      - force: True
      - tags: monitoring, user
      - perms:
        - '/':
          - '.*'
          - '.*'
          - '.*'
      - runas: root
