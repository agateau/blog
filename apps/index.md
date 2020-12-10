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
### [{{ app.name }}]({{ app.url }})

{{ app.description }}
{% if app.screenshot is defined %}

[![Screenshot of {{ app.name }}]({{ app.screenshot }})]({{ app.url }})
{% endif %}
{% endfor %}

## Command line tools

{% for app in cmdlinetools: %}
### [{{ app.name }}]({{ app.url }})

{{ app.description }}
{% endfor %}
