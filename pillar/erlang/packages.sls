packages:
  install:
    m4:
    make:
    autoconf:
    {% if grains['os_family'] == 'RedHat' %}
    ncurses-devel:
    java-1.8.0-openjdk-devel:
    openssl-devel:
    {% endif %}
    {% if grains['os_family'] == 'Debian' %}
    libncurses-dev:
    openjdk-8-jdk:
    libssl-dev:
    {% endif %}
