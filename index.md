---
layout: default
---

<div id="name">
{% capture name %}{% include 01-name.md %}{% endcapture %}
{{ name | markdownify }}
</div>

<div id="image">
{% capture image %}{% include 02-image.md %}{% endcapture %}
{{ image | markdownify }}
</div>

<div id="vitals">
{% capture vitals %}{% include 03-vitals.md %}{% endcapture %}
{{ vitals | markdownify }}
</div>

<div id="experience">
{% capture experience %}{% include 04-experience.md %}{% endcapture %}
{{ experience | markdownify }}
</div>

<div id="website">
{% capture website %}{% include 05-website.md %}{% endcapture %}
{{ website | markdownify }}
</div>
