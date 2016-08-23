#!/bin/bash
# bootstrap.sh
# Author:
#    Nghiem Ba Hieu
# Date:
#    August 20, 2016
#
ubuntu_code=$(lsb_release -c | awk '{print $2}')
# installing prerequisites
apt-get update
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
cat > /etc/apt/sources.list.d/docker.list <<END
deb https://apt.dockerproject.org/repo ubuntu-${ubuntu_code} main
END
apt-get update
apt-get purge -y lxc-docker
apt-cache policy docker-engine
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
# start installing Docker
apt-get install -y docker-engine
# configure user to run docker
id vagrant | grep docker || {
    grep docker /etc/group && {
        gpasswd -a vagrant docker
    }
}

# Reference
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
