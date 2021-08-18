#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libid3tag
export VERSION=0.15.1b
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://sourceforge.net/projects/mad/files/libid3tag/0.15.1b/libid3tag-0.15.1b.tar.gz
export SOURCE=libid3tag-0.15.1b.tar.gz
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