# download.python3.4:
#   file.managed:
#     - name: /tmp/Python-3.4.1.tgz
#     - source: https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tgz
#     - source_hash: md5=26695450087f8587b26d0b6a63844af5
#     - unless: which python3.4

install.python3.4:
  pkg.installed:
    - pkgs:
      - python34

# install.pip3.4:
#   cmd.run:
#     - name: |
#         curl -L https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
#         python3.4 /tmp/get-pip.py
#     - cwd: /tmp
#     - shell: /bin/bash
#     - timeout: 300
#     - unless: which pip3.4
#     - require:
#       - file: /tmp/Python-3.4.1.tgz
