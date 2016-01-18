{% set VER = salt['pillar.get']('redis:version') %}

download__and_extract_redis_package:
  archive.extracted:
    - source: http://download.redis.io/releases/redis-{{VER}}.tar.gz
    - source_hash: sha1=4b1c7b1201984bca8f7f9c6c58862f6928cf0a25
    - name: /opt/
    - archive_format: tar
    - tar_options: v
    - if_missing: /opt/redis-{{VER}}.tar.gz

compile_redis:
  cmd.run:
    - name: |
        cd /opt/redis-{{VER}}/deps/
        make hiredis jemalloc linenoise lua
        cd ..
        make
        make install
    - unless: ls /usr/local/bin/redis-server

copy_redis_config:
  file.managed:
    - name: /etc/redis.conf
    - source: salt://files/redis/redis.conf
    - mode: 0755

copy_systemd_service:
  file.managed:
    - name: /etc/systemd/system/redis-server.service
    - source: salt://files/redis/redis-server.service
    - mode: 0755

enable_and_run_service:
  cmd.run:
    - user: root
    - name: |
        systemctl enable redis-server
        systemctl start redis-server
