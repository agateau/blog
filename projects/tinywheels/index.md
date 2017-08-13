public: yes
tags: []
title: Tiny Wheels
disqus: false
latest_version: 0.2
gallery:
  - full: 0.1/snow.png
    alt: Spreading havoc in the snow
  - full: 0.1/city.png
    alt: Going after an heavily armored roadster in the city
  - full: 0.2/hud.png
    alt: The new virtual buttons, and the turbo in action

<div style="float: right; margin-left: 6px"><img src="icon.png"></div>

Tiny Wheels is a top-down racing game for Android.

## Gallery

.. gallery::
    - full: 0.1/snow.png
      alt: Spreading havoc in the snow
    - full: 0.1/city.png
      alt: Going after an heavily armored roadster in the city
    - full: 0.2/hud.png
      alt: The new virtual buttons, and the turbo in action

## Becoming a Tester

Want to help out by kicking the tires of upcoming versions? Become a tester!

You can download the latest version for your Android device or for PCs from here:

<p>
<% version = @item[:latest_version] %>
<a href="/static/tinywheels/tinywheels-<%= version %>.apk" class="gyl-button">tinywheels-<%= version %>.apk</a>
<a href="/static/tinywheels/tinywheels-<%= version %>.tar.bz2" class="gyl-button">tinywheels-<%= version %>.tar.bz2</a>
</p>

Found a bug? Report it on [Tiny Wheels bug tracker](http://github.com/agateau/tinywheels/issues).

<!--
<h2>Latest Tiny Wheels News</h2>

<% items_with_tag('tinywheels').sort{ |a,b| b[:created_at] <=> a[:created_at] }[0, 10].each do |item| %>
<h3><%= link_to item[:title], item.path %>
<span class="post-meta"><%= item[:created_at].strftime('%B %d, %Y') %></span>
</h3>
<% end %>
</section>
-->
