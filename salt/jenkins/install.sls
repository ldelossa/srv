install_jenkins_repo:
{% if grains['os_family'] == 'RedHat' %}
  cmd.run:
    - name: |
        curl -L http://pkg.jenkins-ci.org/redhat/jenkins.repo -o /etc/yum.repos.d/jenkins.repo
        rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
    - unless:
      - ls /var/lib/jenkins
{% elif grains['os_family'] == 'Debian' %}
  cmd.run:
    - name: |
        wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
        sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
        apt-get update
    - unless:
      - ls /var/lib/jenkins
{% endif %}
  pkg.installed:
    - name: jenkins
  service.running:
    - name: jenkins
    - enable: True
