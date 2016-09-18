# Testing cloud-init with Vagrant

An easy way of testing a cloud-init config file inside Vagrant. Currently based
on Ubuntu 16.04 Xenial Xerus.

## Install mkisofs/genisoimage

On Debian/Ubuntu:

```
sudo apt-get install genisoimage
```

On OS X Macports:

```
sudo port install cdrtools
```

## Usage

Create a new nocloud.iso file, and start Vagrant:

```
make
vagrant up
```
