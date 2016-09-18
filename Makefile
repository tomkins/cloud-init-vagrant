
nocloud.iso: meta-data user-data
	mkisofs \
		-joliet -rock \
		-volid "cidata" \
		-output nocloud.iso meta-data user-data
