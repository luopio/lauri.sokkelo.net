---
layout: post
title:  "Background Shuffler"
date:   2010-06-07 07:57:52 
categories: coding linux release 
---
The need to code "something completely different" made me do **Background Shuffler** - a beautiful background changer for Gnome. I wanted to extend the [UNIX philosophy](http://www.faqs.org/docs/artu/ch01s06.html) to desktop applications so Background Shuffler only changes your background. It does not make coffee.

So I spent a few days hacking and with the help of great tools and libraries like [Quickly](https://wiki.ubuntu.com/Quickly) and [appindicator](https://launchpad.net/ubuntu/lucid/+package/python-appindicator) I managed to build this nifty little program that I'm using all the time now.

Features:

* handle all through the **indicator icon**. No mysterious script running in the background, retain complete control over your desktop at all times
* make the backgrounds change as quickly or slowly as you like
* integrates with **F-Spot**, so search for certain tags or ratings
* optionally specify a **folder** that will be searched with photos

But I guess screenshots explain a thousand words.					

![](/images/kassi/f7d877d2baed06ed122d7928b9e4a2d7.png 'screenshot 1')

![](/images/kassi/7ce5a67d4e0bc19593099de1aa41434c.png 'screenshot 2')

You'll probably be best running Ubuntu Lucid (10.04). To install the app just download the deb or add the ppa to your sources at: [https://edge.launchpad.net/~luopio/+archive/ppa](https://edge.launchpad.net/~luopio/+archive/ppa)

Bugs, suggestions and **patches** welcome! Email at lauri(dot)kainulainen(at) gmail.com			
