chef-lab
========

Chef Learning &amp; Testing Laboratory

## Introduction

This projects provides a series of Vagrant virtual machines that you can use to experiment with Chef configurations. It (of course) uses Chef to configure itself.

## Pre-Requisites

Vagrant and Virtualbox.

I highly recommend installing vagrant-vbguest, which will automatically update the VirtualBox Guest Additions on each Vagrant virtual machine. Install it by typing:

```
vagrant plugin install vagrant-vbguest
```

Please note that the following error is perfectly normal during Vagrant bootup with vagrant-vbguest installed. It's because there's no GUI installed in our Vagrant virtual machines.

```
Installing the Window System drivers ...fail!
(Could not find the X.Org or XFree86 Window System.)
An error occurred during installation of VirtualBox Guest Additions 4.3.6. Some functionality may not work as intended.
In most cases it is OK that the "Window System drivers" installation failed.
```


## Installation

Clone the repo to your local hard drive, change to it, and enter "vagrant up."
"
