SAMPLE_DIR=./examples/

CI_SAMPLE_DIR=${SAMPLE_DIR}/cloud-init/010-init/
VG_SAMPLE_DIR=${SAMPLE_DIR}/vagrants/010-init/
MD_SAMPLE_DIR=./

GENISOIMAGE := $(shell genisoimage -version 2>/dev/null)

ifdef GENISOIMAGE
	MKISOFS = genisoimage
else
	MKISOFS = mkisofs
endif

nocloud.iso: meta-data user-data
	${MAKE} check
	$(MKISOFS) \
	 -joliet -rock \
	 -volid "cidata" \
	 -output nocloud.iso \
	   ${MD_SAMPLE_DIR}/meta-data \
	   ${CI_SAMPLE_DIR}/user-data

all:
	${MAKE} link
	${MAKE} nocloud.iso
	 vagrant up

recreate_all: ## "make all" with forced deletion of the vagrant box, use with care
	${MAKE} link
	${MAKE} nocloud.iso
	 vagrant destroy -f && \
	 vagrant up

check: ## Check cloud-init syntax
	cloud-init devel schema --config-file user-data

link: ## Link to the current directory to ease development
	rm -f ./Vagrantfile && ln -s ${VG_SAMPLE_DIR}/Vagrantfile ./Vagrantfile
	rm -f ./user-data   && ln -s ${CI_SAMPLE_DIR}/user-data   ./user-data
