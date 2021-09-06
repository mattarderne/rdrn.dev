---
layout: single
title: Writing
excerpt: "Collection of Writing."
exclude: false
---

I've been putting my thoughts together on modern data analytics systems.  Describe your day-job stuff. Topics cover the intersection of Data Engineering and Data Analytics. 

I've also been trying some other things, relating to current interests.

These are the _top posts_

---



{% for post in site.posts %}
    {% if post.tags contains 'Top Post' %}

    
## <a href="{{ post.url | relative_url }}" rel="permalink">{{ post.title }}</a>  

> <p class="archive-item-excerpt" itemprop="description">{{ post.excerpt | markdownify |  truncate: 250 }}
<i><time datetime="{{ page.date | date_to_xmlschema }}">{{ post.date | date: "%e %B %Y" }}</time>  </i>   ---   {% capture page_tags %}{% for tag in post.tags %}{{ tag }}{% unless forloop.last %}, {% endunless %}{% endfor %}{% endcapture %}{% for hash in page_tags %}{{ hash }}   {% endfor %}

    {% endif %}
{% endfor %}

<!-- **Archive [here](/writing/writing_archive), copied from Substack in due course.** -->

<!-- <img name="absurd.design" src="/assets/images/ad_blog.png" alt=""/> -->
