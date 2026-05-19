---
layout: page
permalink: /resume/
title: CV/Resume
nav: true
cv_path: /assets/pdf/cv.pdf
resume_path: /assets/pdf/resume.pdf
---

<section id="cv-resume-section-wrapper">
    <div class="container">
        {% include cv_resume.html
                   cv_path=page.cv_path
                   resume_path=page.resume_path
                   default="resume" %}
    </div>
</section>
