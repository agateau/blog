---
public: yes
tags: []
title: "Apps"
comments: false
jinja: true
---

Here are some of the apps and tools I created. You can find others on my [GitHub page](http://github.com/agateau).

## Graphical apps

{% for app in apps: %}
### [{{ app.name }}]({% if app.github %}https://github.com/agateau/{{ app.github }}{% else %}{{ app.url }}{% endif %})

{{ app.description }}
{% endfor %}

## Command line tools

{% for app in cmdlinetools: %}
### [{{ app.name }}]({% if app.github %}https://github.com/agateau/{{ app.github }}{% else %}{{ app.url }}{% endif %})

{{ app.description }}
{% endfor %}
