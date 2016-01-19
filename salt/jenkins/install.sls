install_jenkins_repo:
  cmd.run:
    - name: |
        curl -L http://pkg.jenkins-ci.org/redhat/jenkins.repo -o /etc/yum.repos.d/jenkins.repo
        rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
  pkg.installed:
    - name: jenkins
  service.running:
    - name: jenkins
    - enable: True
