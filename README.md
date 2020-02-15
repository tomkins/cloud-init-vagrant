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


### Examples
Each Vagrantfile shall be able to run a specific range of user-data files based on the following mapping, new cloud-init examples shall be as much as possible compatible with the default Vagrantfile

- Vagrantfile:
	- list of user-data files

- 010-init:
	- 010-init
	- 020-users
	- 030-cmd
	- 040-network
- 020-custom-user:
	- 020-users
