---
layout: single
title: Top Posts
excerpt: "Collection of Writing."
exclude: false
---

Topics cover the intersection of Data Engineering, Analytics and Business. 

Focus on thought-provoking rather than reference manuals.

Published first at [groupby1.substack.com](https://groupby1.substack.com/) and arrive here shortly after. 

Below are the better ones, the rest are on the home page.

Gladly get your feedback (comments, twitter, email).

{% for post in site.posts %}
{% if post.tags contains 'Top Post' %}
  
  
<h2 class="archive-item-title" itemprop="headline">
    <a href="{{ post.url | relative_url }}" rel="permalink">{{ post.title }}</a>
</h2>
<p class="archive-item-excerpt" itemprop="description">{{ post.excerpt | markdownify |  truncate: 300 }} <a href="{{ post.url | relative_url }}" rel="permalink">Read more</a> </p>
<p class="archive-item-date"> <time datetime="{{ page.date | date_to_xmlschema }}">{{ post.date | date: "%e %B %Y" }}</time></p> 
  

{% endif %}
{% endfor %}