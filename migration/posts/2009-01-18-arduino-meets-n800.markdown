---
layout: post
title:  "Arduino meets N800"
date:   2009-01-18 11:53:06 
categories: coding linux arduino 
---
After a few days of tinkering and a few days of waiting for the right parts to arrive I've finally managed to connect an Arduino board to a Nokia N800 internet tablet. First steps towards the Mlab robot.. I was really happy to find out how hackable the internet tablets are! Although there are numerous tutorials around the web, I'll put a short description of what I did before I forget:

# Steps to connect N800 to Arduino #
1. update N800 to OS2008
1. install rootsh to gain super-user access
1. install USB Control (enable Chinook Extras repository)
1. enable host mode through usb control
1. get a *female type A-female type A* USB connector. You might need to solder your USB-USBmini cable a bit if it's only slave mode. I bought one cheap from <verkkokauppa.com> and it seems to work both ways out of the box. I guess you can also use an external power source if you don't want to solder your cable(?).
1. get kernel modules for USB Serial communication and FTDI chips from <http://fanoush.wz.cz/maemo/modules-rx-34-2.6.21.0.tar.gz>
1. unpack and install kernel modules **as root** with

 *insmod usbserial.ko*

 *insmod ftdi_sio.ko*

1. plug in your arduino

## Extra: Python testing
1. get [PySerial](http://pyserial.wiki.sourceforge.net/pySerial) and install it. You can also just copy the python module from some *nix computer (I just copied mine from my linux box)
1. run this:

        import serial

        ser = serial.Serial('/dev/ttyUSB0', 9600)

        while 1:

            print ser.readline()


you should see whatever your arduino chip is printing.

Voilá! You have a connected a very flexible development board with a very hacker friendly, touchscreen enabled linux computer! Think of the possibilities :)									

<img src=df1f56aa7779740891bc2a75604ed72e.jpg />
