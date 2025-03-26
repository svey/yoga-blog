---
layout: full-width
title: Home
weight: 1
---
{% for post in site.posts %}  
### [{{ post.title }}]({{ post.url | prepend: site.baseurl }})
<span style="font-size: 0.8em; font-weight: 300">{{ post.date | date: "%B %-d, %Y" }}</span>
{{ post.excerpt }}
{% endfor %}
