#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=sed
export VERSION=4.4
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/sed/sed-4.4.tar.xz
export SOURCE=sed-4.4.tar.xz
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
#wget http://ftp.gnu.org/gnu/sed/sed-4.4.tar.xz
# setup
setup
./configure --prefix=$SYSROOT/ \
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
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
