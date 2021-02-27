---
layout: single
title: 
excerpt: "I have spent most of my life living near the sea, and have spent a few years working on sailing and motor yachts.
This page gives a brief overview of the time I've spent on the sea or at sea, and is intended to be a personal record and CV."
exclude: true
---

A sailing CV of sorts.

I have spent most of my life living near the sea, and have spent a few years working on sailing and motor yachts.
This page gives a brief overview of the time I've spent on the sea or at sea, and is intended to be a personal record and CV.

# Details 
```
Location: {{ site.location }}
Profession: Data Engineer
Nationality: South African

Qualifications:
* Day Skipper
* Yacht Rating
* Powerboat II
* STCW95 (expired)

Sea Miles:
* Motor: ~5000nm
* Sail: ~3000nm 
* Offshore Racing: ~1000nm
```

**Crewing Profiles:** 

* [crewbay](https://www.crewbay.com/profile/crew/49845)
* [findacrew](https://www.findacrew.net/en/crew/3258430)
* [tendrr](https://tendrr.co/profile/Matta)

## Logbook
<iframe class="airtable-embed" src="https://airtable.com/embed/shr0v5VP4KkvjAss5?backgroundColor=cyan&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

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