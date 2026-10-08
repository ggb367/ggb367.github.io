---
layout: page
permalink: /resume/
title: CV/Resume
nav: true
cv_path: /assets/pdf/gilberto_briscoe-martinez_cv.pdf
resume_path: /assets/pdf/gilberto_briscoe-martinez_resume.pdf
---

<section id="cv-resume-section-wrapper">
    <div class="container">
        {% include cv_resume.html
                   cv_path=page.cv_path
                   resume_path=page.resume_path
                   default="resume" %}
    </div>
</section>
