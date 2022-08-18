---
layout: single
title: Top Posts
excerpt: "Collection of Writing."
exclude: false
---

I've been putting my thoughts together on modern data analytics systems. 

Topics cover the intersection of Data Engineering and Data Analytics, with a focus on providing thought-provoking content rather than reference manuals for current tech.

Leave me a comment at the bottom of a post if you've enjoyed it or have feedback!

All posts are first published at [groupby1.substack.com](https://groupby1.substack.com/) and arrive here shortly after. You can subscribe there or follow the RSS feed here.

Below are the better ones, the rest are on the home page.

{% for post in site.posts %}
{% if post.tags contains 'Top Post' %}
  
  
<h2 class="archive-item-title" itemprop="headline">
    <a href="{{ post.url | relative_url }}" rel="permalink">{{ post.title }}</a>
</h2>
<p class="archive-item-excerpt" itemprop="description">{{ post.excerpt | markdownify |  truncate: 300 }} <a href="{{ post.url | relative_url }}" rel="permalink">Read more</a> </p>
<p class="archive-item-date"> <time datetime="{{ page.date | date_to_xmlschema }}">{{ post.date | date: "%e %B %Y" }}</time></p> 
  

{% endif %}
{% endfor %}