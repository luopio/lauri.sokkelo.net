---
layout: post
title:  "Gstreamer Live Cinema and VJing?"
date:   2009-01-13 10:36:34 
categories: graphics studies 
---
I'm just taking the realtime visuals workshop here in TaiK and while playing around with Isadora (the app we're using) I started wondering if there's something for Gstreamer that does the same.

Live Cinema is basically about modifying video clips and effects in real time. A lot of these apps rely on sets of patches (another example would be puredata), which usually are a set of components relying and transforming the data before it ends up on the screen.

Gstreamer does this on the low-level. You can do these "patches" even directly through the command line. These include effects. I figured there has to be a gst app for these things, but there isn't.. the only one I found was [Gstreamer Editor](http://gstreamer.freedesktop.org/modules/gst-editor.html)).

I think it would be cool to create one. This could also result in a lot of new effects available for gst. Perhaps one could use [Clutter](http://clutter-project.org) for the UI :).
