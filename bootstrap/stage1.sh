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
