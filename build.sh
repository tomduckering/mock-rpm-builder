#!/bin/bash

#vagrant up
#vagrant provision
vagrant ssh-config > .rpmbuilder-ssh-config
scp -F .rpmbuilder-ssh-config build-rpm.sh default:/tmp
ssh -F .rpmbuilder-ssh-config default sh /tmp/build-rpm.sh
