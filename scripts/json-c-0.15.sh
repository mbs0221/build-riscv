#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=json-c
export VERSION=0.15
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://s3.amazonaws.com/json-c_releases/releases/json-c-0.15.tar.gz
export SOURCE=json-c-0.15.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
# build
build
mkdir build &&
cd    build &&
cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_C_COMPILER=riscv64-unknown-linux-gnu-gcc \
      -DCMAKE_CXX_COMPILER=riscv64-unknown-linux-gnu-g++ \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_STATIC_LIBS=OFF    \
      .. &&
make
# install
install
cd build
make install DESTDIR=$BUILDROOT
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
epilog
