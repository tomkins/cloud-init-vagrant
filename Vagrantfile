# -*- mode: ruby -*-
# vi: set ft=ruby :


CLOUD_CONFIG_PATH = File.join(File.dirname(__FILE__), "nocloud.iso")


Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/xenial64"

    # Disable SSH password for 16.04 - we'll add the insecure Vagrant key
    # (don't worry, it's just an example and gets replaced anyway)
    config.ssh.password = nil

    # To use your main public/private key pair, uncomment these lines:
    # config.ssh.private_key_path = File.expand_path("~/.ssh/id_rsa")
    # config.ssh.insert_key = false

    # Disable shared folders
    config.vm.synced_folder ".", "/vagrant", disabled: true

    # Tweak virtualbox
    config.vm.provider :virtualbox do |vb|
        # Attach nocloud.iso to the virtual machine
        vb.customize [
            "storageattach", :id,
            "--storagectl", "SCSI",
            "--port", "1",
            "--type", "dvddrive",
            "--medium", CLOUD_CONFIG_PATH
        ]

        # Speed up machine startup by using linked clones
        vb.linked_clone = true

        # Workarounds for 16.04 Vagrantfile problems:
        # - can't start more than 1 machine with a static name
        # - serial console slows down the boot process dramatically.
        vb.name = nil
        vb.customize [
            "modifyvm", :id,
            "--uartmode1", "disconnected"
        ]
    end
end
