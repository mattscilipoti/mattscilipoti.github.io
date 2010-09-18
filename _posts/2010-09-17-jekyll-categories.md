---
layout: post
title: Categories for your GitHub Pages (Jekyll)
categories:
- code
- github pages
published: true
---

{{ page.title }}
================

<p class='meta'> 17 Sept 2010 - Laurel, MD</p>

You, like me, have a github pages powered blog.  
You, like me, are contemplating switching to WordPress for tags/categories.
Fret no more.  I added categories to my github pages powered blog today.
You can too.

Just assign a yaml list to categories in your page meta:
    categories:
    - ruby
    - rvm


Listing and linking to them was harder than I expected.
I was forced to create a page for each category that I wanted a list of posts for (code.html, ruby.html).

<p class="update">Update: I went to great pains to format this liquid code (within liquid).  Even using the `--safe` argument on my jekyll server.  But, it still formatted differently on github pages.  I hope to figure out a workaround shortly.  Until then, check out the source <a href="http://github.com/mattscilipoti/mattscilipoti.github.com"> at github</a>.
</p>


For each post, I expected to get a nice list of assigned categories using:
    {{ " {{ post.categories | array_to_sentence_string " }} }}
  instead, I got:
    {{ post.categories | array_to_sentence_string }}
  
Then I tried this (and variations):

    <div id="categories">
      <h2>In this post:</h2>
      <ul class="categories">
        {{" {% for category in post.categories "}} %}
          <li><a href="/{{"{{ category[0] "}} }}.html">{{" {{ category[0] "}} }}</a></li>
        {{" {% endfor"}} %}
      </ul>
    </div>

Which rendered:

<div id="categories">
  <h2>In this post:</h2>
  <ul class="categories">
    {% for category in post.categories  %}
      <li><a href="/{{ category[0] }}.html">{{ category[0] }}</a></li>
    {% endfor %}
  </ul>
</div>

That's right.  Nothing.

`sites.categories` works nicely in that loop, but I wanted the categories for this post.
<div id="categories">
  <h2>In this site:</h2>
  <ul class="categories">
    {% for category in site.categories  %}
      <li><a href="/{{ category[0] }}.html">{{ category[0] }}</a></li>
    {% endfor %}
  </ul>
</div>

Armed with this knowledge, I set out to create a Tag Cloud.  But, I could not find a way to get the count of posts for each category.
I found an example on [litanyagainstfear.com](http://github.com/qrush/litanyagainstfear/blob/master/_layouts/default.html).  Alas, it looks like you have to name each category explicitly to get the count of posts.
    {{" {{ site.categories.code | size "}} }}
    {{" {{ site.categories.ruby | size "}} }}

Which led me to the (poor man's) Tag Cloud you see in the upper right corner.

The good news?  I was able to use _includes to reuse the category page for each category.

See the source for this page [at github](http://github.com/mattscilipoti/mattscilipoti.github.com).
