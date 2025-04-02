---
layout: full-width
title: Home
weight: 1
---
{% for post in site.posts %}  
### [{{ post.title }}]({{ post.url | prepend: site.baseurl }})
{{ post.date | date: "%B %-d, %Y" }}
{{ post.excerpt }}
{% endfor %}
