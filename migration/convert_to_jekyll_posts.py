import csv

POSTS = {}
with open('titles.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=';', quotechar='"')
    for row in reader:
        POSTS[row[0]] = {'title': row[1], 'date': row[2], 'content': [], 'tags': []}

with open('pieces.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=';', quotechar='"')
    for row in reader:
        if row[2] == 'text/markdown':
            POSTS[row[1]]['content'].append(row[3])
            POSTS[row[1]]['type'] = 'text/markdown'
        elif row[2] == 'text/html':
            POSTS[row[1]]['content'].append(row[3])
            POSTS[row[1]]['type'] = 'text/html'
        elif row[2] in ('image/jpg', 'image/jpeg', 'image/png'):
            POSTS[row[1]]['content'].append("<img src=%s />" % row[3])
        elif row[2] == 'text/youtube-id':
            POSTS[row[1]]['content'].append('<iframe width="640" height="360" src="//www.youtube.com/embed/%s" frameborder="0" allowfullscreen></iframe>' % row[3])
        else:
            print "UKNOWN TYPE %s" % row[2]

with open('tags.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=';', quotechar='"')
    for row in reader:
        POSTS[row[1]]['tags'].append(row[2])

import pprint
for pid, p in POSTS.items():
    p['filename'] = p['date'].split(' ')[0] + '-' + p['title'].lower().replace(' ', '-').replace('/', '-')
    if p['type'] == 'text/markdown':
        p['filename'] += '.markdown'
    else:
        p['filename'] += '.html'

    print "------> %s" % p['filename']
    with open('posts/'+p['filename'], 'w') as f:
        f.write("""---
layout: post
title:  "%s"
date:   %s 
categories: %s 
---
%s
""" % (p['title'], p['date'], ' '.join(p['tags']), "\n\n".join(p['content'])))
        f.close
  
