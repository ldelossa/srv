base:
  '*':
    - core.packages
    - core.common
  'dns*':
    - bind.common
    - bind.packages
  'jenkins*':
    - jenkins.common
    - jenkins.packages
