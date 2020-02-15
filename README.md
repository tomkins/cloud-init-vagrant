# Testing cloud-init with Vagrant

An easy way of testing a cloud-init config file inside Vagrant. Currently based
on Ubuntu 16.04 Xenial Xerus.

## Install mkisofs/genisoimage

On Debian/Ubuntu:

```
sudo apt-get install genisoimage
```

On macOS Macports:

```
sudo port install cdrtools
```

## Usage

Link to the desired example to execute, create a new nocloud.iso file, and start Vagrant:

```
make all
```

To use other examples, modify the ```CI_SAMPLE_DIR``` and ```VG_SAMPLE_DIR``` in the ```Makefile``` to the desired sample directory for both cloud-init user-data configuration and Vagrantfile
