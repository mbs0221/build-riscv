#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=inetutils
export VERSION=2.1
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://mirror.bjtu.edu.cn/gnu/inetutils/inetutils-2.1.tar.gz
export SOURCE=inetutils-2.1.tar.gz
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
#wget https://mirror.bjtu.edu.cn/gnu/inetutils/inetutils-2.1.tar.gz
# setup
setup
echo '#define PATH_PROCNET_DEV "/proc/net/dev"' >> ifconfig/system/linux.h
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --disable-logger     \
            --disable-whois      \
            --disable-servers
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