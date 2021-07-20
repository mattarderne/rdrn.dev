---
layout: single
title: 
excerpt: "I have spent most of my life living near the sea, and have spent a few years working on sailing and motor yachts.
This page gives a brief overview of the time I've spent on the sea or at sea, and is intended to be a personal record and CV."
exclude: true
---

![english channel](/assets/photos/sailing/sail.png){: width="1000" }


_Available for crew and delivery_

I have participated in offshore races, deliveries, around the cans and anything else that is going. I can cook and keep watch. My career highlight was 2019 Fastnet, which was a very rewarding experience, and possibly something I'd like to do again (also the first and only time I've been seasick... the Irish sea!).  

Looking to build overnight watch-keeping sea miles for Yachtmaster. 

I have spent most of my life living near the sea, and have spent a few years working on sailing and motor yachts.


# Details 

**Personal:**
* {{ site.location }}
* Data Engineer
* South African



**Qualifications:**
* Day Skipper
* Yacht Rating
* Powerboat II
* STCW95 (expired)
* Have my own offshore sailing and safety kit

**Sea Miles:**
* Motor: ~5000nm
* Sail: ~3000nm 
* Offshore Racing: ~1000nm


**Crewing Profiles:** 

* [crewbay](https://www.crewbay.com/profile/crew/49845)
* [findacrew](https://www.findacrew.net/en/crew/3258430)
* [tendrr](https://tendrr.co/profile/Matta)

## Logbook

[logbook](https://rdrn.notion.site/ac2eb4bc4ea54ff7a7e04c1333e3d57b?v=10edd97e18994394b9cfe3e45961e0dd)


---

# Highlights

<div class="photos">
    {%- for photo in site.data.photos -%}
        {% if photo.tag contains 'sailing' %}
            {%- assign a = photo.src | split: '/20' -%}
            {%- assign id = a[1] | split: '.' -%}
            {%- assign id = id[0] -%}
            <div class="thumb" id="img-{{ id }}">
                <label for="{{ forloop.index }}">
                    <img loading="lazy" class="thumb-image" src="{{ photo.src }}" alt="{{ photo.caption }}">
                    <div class="caption">
                        <span class="photo-date">{{ photo.date }}</span>
                        <span class="photo-caption">{{ photo.caption }}</span>
                    </div>
                </label>
                <input class="modal-state" id="{{ forloop.index }}" type="checkbox">
                <div class="modal">
                    <!-- <div id="left-{{- forloop.index -}} " style="left:20px" class="modal-arrow">ᐸ</div>
                    <div id="right-{{- forloop.index -}}" style="right:20px" class="modal-arrow">ᐳ</div> -->
                    <label for="{{ forloop.index }}">
                        <div class="modal-content">
                            <img loading="lazy" class="modal-photo" src="{{ photo.src }}" alt="{{ photo.caption }}">
                            <div>
                                <span class="photo-date">{{ photo.date }} - {{ photo.caption }}</span>
                                <br>
                                <span class="photo-description">{{ photo.description }}</span>
                            </div>
                        </div>
                    </label>
                </div>
            </div>
        {% endif %}
    {%- endfor -%}
</div>


<!-- <img name="absurd.design" src="/assets/images/ad_landing.png" alt=""/> -->