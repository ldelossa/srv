
erlang:
  {% if grains['os_family'] == 'RedHat' %}
  erlang_package: 'http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_18.1-1~centos~7_amd64.rpm'
  erlang_version: '18.1'
  {% elif grains['os_family'] == 'Debian' %}
  erlang_package: 'http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_general/esl-erlang_18.1-1~ubuntu~vivid_amd64.deb'
  erlang_version: '18.1'
  {% endif %}
