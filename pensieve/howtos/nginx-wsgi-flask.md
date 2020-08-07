public: no
pub_date: 2017-03-04 12:22:00 +01:00
tags: [nginx, wsgi, flask, howto]
title: "nginx + WSGI + Flask"
comments: false

## uwsgi

Create /etc/uwsgi/apps-available/foo.ini

```
[uwsgi]
# Or `plugin = python` for Python 2
plugin = python3
uid = www-data
gid = www-data
# If the app runs in a virtualenv:
virtualenv = /opt/sites/foo/venv
# If you need to setup environment variables:
env = MY_VAR=a_value
manage-script-name = True
chdir = /opt/sites/foo
mount = /foo=main:app
```

Then create a symlink to enable the app:

```
cd /etc/uwsgi/apps-enabled
ln -s /etc/uwsgi/apps-available/foo.ini
```

Try manually:

```
sudo uwsgi --http-socket :9999 --ini /etc/uwsgi/apps-available/foo.ini
```

Point your browser to <http://yourhost:9999>.

## nginx conf

Can go in /etc/nginx/sites-available/default for example

```
# Declare the foo app
upstream foo {
    server unix:///var/run/uwsgi/app/foo/socket;
}
server {
    # ...
    # To serve /foo/ with $name
    location /foo/ {
        uwsgi_pass foo;
        include uwsgi_params;
    }
    # To serve files in /opt/sites/foo/static as /foo/static/
    location /foo/static/ {
        root /opt/sites;
    }
}
```

## Start

```
sudo service uwsgi start
sudo service nginx start
```
