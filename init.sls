nginx:
  pkg.installed:
    - name: nginx
    - refresh: True
    - version: {{ salt['pillar.get']('nginx:version', '1.18.0-6ubuntu14.4') }}

nginx.service:
  service:
    - running
    - enable: True

/var/www/html/index.nginx-debian.html:
  file.managed:
    - source: salt://{{ slspath }}/index.html
    - user: root
    - group: root

nginx_reload:
  cmd.run:
    - name: nginx -s reload 

