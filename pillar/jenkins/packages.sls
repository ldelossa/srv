packages:
  install:
    {% if grains['os_family'] == 'RedHat' %}
    java-1.7.0-openjdk:
    {% endif %}
    {% if grains['os_family'] == 'Debian' %}
    openjdk-8-jdk:
    {% endif %}
