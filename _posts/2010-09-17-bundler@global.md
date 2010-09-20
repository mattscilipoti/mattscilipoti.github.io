---
layout: post
title: Embracing RVM's Global Gemset
categories:
- ruby
- rvm
published: true
---

{{ page.title }}
================

<p class='meta'> 17 Sept 2010 - Prince William Forest Park, VA</p>

In the brave new world of bundler and rvm, I have been looking for a way to manage my global gems.
The latest iteration is working pretty good.

rvm provides `~/.rvm/gemsets/global.gems`, but this only runs when a ruby is first installed.  I need to manage my day by day changes.

Enter ~/Gemfile.global.

    rvm ree@global
    bundle install --gemfile=~/Gemfile.global
    
Simple enough.  But very helpful.

Today I started playing with ruby 1.9.2.  Some of the gems in Gemfile.global aren't quite ready yet.
I started editing a copy, named `Gemfile.global19`, but that seemed like folly.

Enter `group "1.8"`.

For 1.8, use `bundle install --without "1.9" --gemfile=~/Gemfile.global`<br/>
For 1.9, use `bundle install --without "1.8" --gemfile=~/Gemfile.global`

Note: a symbol, which is a number (:1.8), causes problems.  Use a string ("1.8").

Seeing the Gemfile might help:

    source :rubygems

    gem 'autotest'
    gem 'autotest-fsevent'
    gem 'autotest-notification'
    gem 'autotest-rails'
    gem 'cheat'
    gem 'diff-lcs'
    gem 'github'
    gem 'hitch'
    gem 'jeweler'
    gem 'rake'
    gem 'rdoc'
    gem 'rdoc-data'
    gem 'sqlite3-ruby'
    gem 'thin'
    gem 'thor'
    gem 'watchr'
    gem 'yard'

    group :irb do
      gem 'hirb'
      gem 'method_lister'
      gem 'wirble'
    end
    
    group '1.8' do
      gem 'hammertime' 
      gem 'ruby-debug' # highline is not 1.9 compatible.  highline1.9 is.
    end

    group '1.9' do
      gem 'ruby-debug19'
    end
