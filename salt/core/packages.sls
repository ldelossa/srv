install_packages:
  pkg.installed:
    - pkgs:
    {% for pkg in salt['pillar.get']('packages:install') %}
      - {{ pkg }}
    {% endfor %}

remove_packages:
  pkg.purged:
    - pkgs:
    {% for pkg in salt['pillar.get']('packages:remove') %}
      - {{ pkg }}
    {% endfor %}

update_cache:
  cmd.run:
    - name: |
        yum makecache
    - onchanges:
      - pkg: install_packages
