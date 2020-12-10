public: yes
tags: []
title: "Games"
comments: false
jinja: true

{% for category in categories: %}
## {{ category.name }}
{% for app in category.apps %}
### [{{ app.name }}]({{ app.url }})
<small>Platforms: {{ app.platforms|join(", ") }}</small>

{{ app.description }}
{% if app.screenshot is defined %}

[![Screenshot of {{ app.name }}]({{ app.screenshot }})]({{ app.url }})
{% endif %}
{% endfor %}
{% endfor %}
