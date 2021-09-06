---
layout: single
title: Top Posts
excerpt: "Collection of Writing."
exclude: false
---

I've been putting my thoughts together on modern data analytics systems.  Describe your day-job stuff. Topics cover the intersection of Data Engineering and Data Analytics. I've also been trying some other things, relating to current interests. These are the posts I've put the most effort into




{% for post in site.posts %}
{% if post.tags contains 'Top Post' %}
  
  
<h2 class="archive-item-title" itemprop="headline">
    <a href="{{ post.url | relative_url }}" rel="permalink">{{ post.title }}</a>
</h2>
<p class="archive-item-excerpt" itemprop="description">{{ post.excerpt | markdownify |  truncate: 300 }} <a href="{{ post.url | relative_url }}" rel="permalink">Read more</a> </p>
<p class="archive-item-date"> <time datetime="{{ page.date | date_to_xmlschema }}">{{ post.date | date: "%e %B %Y" }}</time></p> 
  

{% endif %}
{% endfor %}