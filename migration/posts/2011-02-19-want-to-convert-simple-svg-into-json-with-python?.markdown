---
layout: post
title:  "Want to convert simple SVG into JSON with Python?"
date:   2011-02-19 17:30:52 
categories: howto graphics coding release 
---
Why on earth would you want to do that? My reason was that I needed to draw SVG in [Processing.js](http://www.processingjs.org). So I took a simple flat SVG with filled polygons and converted it to JSON, which then is drawn by PJS. Here's the Python JSON extraction snippet.

<pre><code>#!/usr/bin/python
''' 
    Convert a simple svg to a bunch of javascript
    arrays that can be drawn in code
    stdout get the json
    stderr print some information helpful in the js code
    
    @author Lauri Kainulainen - lauri.sokkelo.net
'''

import sys
from xml.dom import minidom
import simplejson

if len(sys.argv) < 2:
    print "usage:", __file__, "SVG_FILE"
    sys.exit(1)
d = minidom.parse(sys.argv[1])

points = []
minx, miny = 10000, 10000
maxx, maxy = 0, 0
amount_of_polys = 0
for c in d.childNodes[1].childNodes:
    if c.nodeName != '#text' and c.tagName == 'polygon':
        coords = c.attributes.get('points').value.split(" ")
        polygon_data = {}
        polygon_points = []
        for coord in coords:
            x, y = coord.split(',')
            x, y = float(x), float(y)
            minx = min(minx, x)
            miny = min(miny, y)
            maxx = max(maxx, x)
            maxy = max(maxy, y)
            polygon_points.append((x, y))
        polygon_data['points'] = polygon_points
        if c.attributes.get('fill'):
            val = c.attributes.get('fill').value
            if val.startswith('#'):
                r, g, b = int(val[1:3], 16), int(val[3:5], 16), int(val[5:], 16)
                polygon_data['fill'] = (r, g, b)
            else:
                polygon_data['fill'] = c.attributes.get('fill').value
        amount_of_polys += 1
        points.append(polygon_data)

print simplejson.dumps(points, indent=2)
sys.stderr.write('\n ~# Wicked SVG Statz: #~\n')
sys.stderr.write('  min X,Y: %s, %s\n' % (minx, miny))
sys.stderr.write('  max X,Y: %s, %s\n' % (maxx, maxy))
sys.stderr.write('  polygons: %s\n' % (amount_of_polys))
sys.stderr.write('\n')
</code></pre>

Then you probably want it on the screen. We used the following processingjs snippet on [Helsinki New Media Locomotive site](http://locomotivehelsinki.org) for testing:

<pre><code>
void setup()
{
    size(300,300);
    background(255);
    noLoop();
    strokeWeight(0.5);
}

void draw(){  
    var data = YOUR_OWN_DATA_ELEMENT; // make this point to your JSON structure
    for(int i = 0; i < data.length; i++) {
        var pd = data[i];
        fill(pd.fill[0], pd.fill[1], pd.fill[2]);
        beginShape();
        for(int ii = 0; ii < data[i].points.length; ii++) {
            var point = pd.points[ii];
            vertex(point[0], point[1]);
        }
        endShape(CLOSE);
    }
}
</code></pre>
