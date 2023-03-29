Role Nginx
=========

Requirements
------------
Для установки роли отредактируйте 'requirements.yml'
````bash
  - name: nginx_role
    src: git@github.com:kirill-karagodin/nginx_role.git
    scm: git
    version: "[last version]"
````

Role Variables
--------------
**default/main.yml** - изменяемые параметры. Директория для записи логов Nginx (указана по-умолчанию, при желании можно
изменить)

Example Playbook
----------------
````bash
- name: Install nginx
  hosts: [host]
  roles:
    - nginx_role
````
License
-------
MIT


