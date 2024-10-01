---
layout: page
permalink: /publications/
title: publications
description: A list of my publications.
years: [2024, 2019]
nav: true
---

<section id="post-cv">
    <div class="container">
        <div id="article">

        {% for y in page.years %}
            <h1>{{ y }}</h1>
            {% include pubs.html year=y publications=site.data.publications %}
        {% endfor %}

        </div>
    </div>
</section>
