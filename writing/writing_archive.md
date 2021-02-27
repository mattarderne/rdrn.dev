---
layout: single
title: Writing Archive
excerpt: "Collection of All Writing."
exclude: true
---


> All posts, archived here for resilience  

{% for post in site.posts %}
    

### <a href="{{ post.url | relative_url }}" rel="permalink">{{ post.title }}</a>  -  <i><time datetime="{{ page.date | date_to_xmlschema }}">{{ post.date | date: "%e %B %Y" }}</time></i> - {{ post.blog }} 


> <p class="archive-item-excerpt" itemprop="description">{{ post.excerpt | markdownify |  truncate: 250 }}

{% endfor %}

<img name="absurd.design" src="/assets/images/ad_blog.png" alt=""/>