#!/bin/bash
set -e
set -x

if ! test -e /usr/bin/git; then
    echo Installing git...
    apt-get -y -o DPkg::Options::=--force-confnew install git
else
    echo git is already installed
fi

PUPPETREPO_FILE=/etc/apt/sources.list.d/puppetlabs.list
if ! test -e $PUPPETREPO_FILE; then
    echo Setting up repo sources...
    wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
    dpkg -i puppetlabs-release-wheezy.deb
    rm puppetlabs-release-wheezy.deb
    apt-get update
else
    echo puppet sources already exist
fi

if ! test -e /usr/bin/puppet; then
    echo Installing puppet...
    apt-get -y -o DPkg::Options::=--force-confnew install puppet
else
    echo puppet is already installed
fi

if ! test -d /etc/puppet/modules/vcsa; then
    echo Installing vcsa module
    puppet module install vmware/vcsa
else
    echo already installed  vmware/vcsa
fi

if ! test -d /etc/puppet/modules/vcenter; then
    echo Installing vcenter module
    puppet module install vmware/vcenter
else
    echo already installed  vmware/vcenter
fi

if ! test -d /etc/puppet/modules/vshield; then
    echo Installing vshield module
    puppet module install vmware/vshield
else
    echo already installed  vmware/vshield
fi

if ! test -d /etc/puppet/modules/dhpd; then
    echo Installing dhcp module
    puppet module install zleslie/dhcp
else
    echo already installed  zleslie/dhcp
fi
