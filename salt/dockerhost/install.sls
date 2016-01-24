install_docker:
  cmd.run:
    {% if grains['os_family'] == 'RedHat' %}
    - name: |
        tee /etc/yum.repos.d/docker.repo <<-'EOF'
        [dockerrepo]
        name=Docker Repository
        baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
        enabled=1
        gpgcheck=1
        gpgkey=https://yum.dockerproject.org/gpg
        EOF
    {% endif %}
    - unless:
      - which docker
  pkg.installed:
    - name: docker-engine
  service.running:
    - name: docker
    - enabled: True
    - reload: True
