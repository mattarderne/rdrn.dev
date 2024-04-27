---
layout: single
title: 
excerpt: "Collection of Writing."
exclude: false
---


{% for post in site.posts %}
  
  <article class="archive-item" itemscope itemtype="https://schema.org/CreativeWork">
    <h2 class="archive-item-title" itemprop="headline">
      <a href="{{ post.url | relative_url }}" rel="permalink">{{ post.title }}</a>
    </h2>
    <p class="archive-item-excerpt" itemprop="description">{{ post.excerpt | markdownify |  truncate: 300 }} <a href="{{ post.url | relative_url }}" rel="permalink">Read more</a> </p>
    <p class="archive-item-date"> <time datetime="{{ page.date | date_to_xmlschema }}">{{ post.date | date: "%e %B %Y" }}</time></p> 
  

{% endfor %}