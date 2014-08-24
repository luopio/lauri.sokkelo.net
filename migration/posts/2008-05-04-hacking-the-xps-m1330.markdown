---
layout: post
title:  "Hacking the XPS M1330"
date:   2008-05-04 17:36:18 
categories: howto xps linux 
---
Dell Media direct proved out to be a Windows CE Embedded system with a simple media GUI. Not really useful, since it only reads FAT-drives and has no network connection.

Since it's a windows system, it only took me two minutes to break it and start ending up with a blue screen of death on each MD bootup (I honestly didn't do anything wrong.. just used it, it hanged and then I had to hard boot..).

I've been thinking about replacing the system with a quick'n'small linux distro with something like [Elisa](http://elisa.fluendo.com/) starting up instantly, so I did some research and it seems that starting with the **home button starts the MBR**, while the **normal start button fires up the active partition** (you can only have one). 

Unfortunately if I install GRUB on the linux partitions start and mark it active, vista hijacks the boot flag to its own partition. So now I have GRUB on MBR and MD still works.. for now.

** Quick how to fix your broken MD Howto **

This is what I did to fix the blue screen of MD death

1. Get the [Dell MD recovery disk](http://support.ap.dell.com/support/topics/global.aspx/support/dsn/en/document?docid=26B720E7D596B89DE040A68F5B280867&c=my&l=en&s=gen) and follow the instructions
2. After this I ended up with a broken windows install, so insert the vista CD and do the repair bit that comes after you choose the language.
3. Insert your flavor of live CD linux (I used [Puppy](http://puppylinux.com/) and I heartily recommend it)
4. Install grub to your MBR with grub-install /dev/sda

I guess I'll look into replacing the MD with a linux distro at some point. I found a [howto on it](http://caffeinbar.com/wp/2007/03/08/start-linux-with-dell-mediadirect-button/), but I really want to:
- press the power button to enter grub to choose between "the main linux" and vista
- press home to boot a quick, small linux for media stuff

If you've already succeeded or are interested in the same thing send me a mail at lauriATsokkeloDOTnet	
