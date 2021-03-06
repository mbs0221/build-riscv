#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=dbus
export VERSION=1.10.14
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://dbus.freedesktop.org/releases/dbus/dbus-1.10.14.tar.gz
export SOURCE=dbus-1.10.14.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
post
# pre
prep
# setup
setup
export LDFLAGS='-lrt'
./configure --prefix=/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-systemdsystemunitdir=$BUILDROOT/lib/systemd/system
# build
build
make -j$(nproc)
# install
install
make install DESTDIR=$BUILDROOT
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
