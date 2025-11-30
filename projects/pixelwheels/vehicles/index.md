---
public: yes
tags: []
title: Pixel Wheels vehicles
comments: false
jinja: true
---

<nav class="page-nav">
<ul>
    <li><a href="../">Home</a></li>
    <li class="active"><span>Vehicles</span></li>
    <li><a href="../goodies/">Merch</a></li>
</ul>
</nav>

{% for vehicle in vehicles: %}

## <span id="{{ vehicle.id }}">{{ vehicle.name }}</span>

<div style="float: right; margin-left: 6px"><img src="{{ vehicle.id }}.png"></div>

{{ vehicle.description }}
{% endfor %}
