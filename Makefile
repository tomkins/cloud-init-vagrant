
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
	 -output nocloud.iso meta-data user-data

check:
	cloud-init devel schema --config-file user-data
