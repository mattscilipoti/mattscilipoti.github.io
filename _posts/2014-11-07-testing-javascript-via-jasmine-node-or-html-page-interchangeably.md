---
title: "Testing Javascript via jasmine-node OR html page (interchangeably)"
date: 2014-11-07
author: "Matt Scilipoti"
---

For my [WDI](https://generalassemb.ly/education/web-development-immersive) class at General Assembly, we wanted to write some specs and be able to run them either in jasmine-node OR from a jasmine HTML page (a SpecRunner), interchangeably. After some experimentation, I found I could add a simple conditional to the spec file to require the code file (via Node.js) if I wasn’t in a browser. The conditional just checks for the existence of `window`. I created a gist with a working example. The important code is: `if (typeof window === 'undefined')`.

{% gist mattscilipoti/935b41d202da39de0f49 %}
