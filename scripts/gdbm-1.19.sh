#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=gdbm
export VERSION=1.19
# Release:        1%{?dist}
# Group:          Database
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
export SOURCE=gdbm-1.19.tar.gz
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
#wget http://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
# setup
setup
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
