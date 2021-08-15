#!/bin/bash
source ../build-utils.sh
export NAME=attr
export VERSION=2.4.47
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://download.savannah.gnu.org/releases/attr/attr-2.4.47.src.tar.gz
export SOURCE=attr-2.4.47.src.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# # A helloworld program from the packagecloud.io blog!
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
