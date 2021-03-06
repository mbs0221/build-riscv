#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=glib
export VERSION=2.69.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://download.gnome.org/sources/glib/2.69/glib-2.69.1.tar.xz
export SOURCE=glib-2.69.1.tar.xz
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
#wget https://download.gnome.org/sources/glib/2.69/glib-2.69.1.tar.xz
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
meson --prefix=$SYSROOT/usr \
      -Dxattr=false \
      -Dinstalled_tests=true \
      -Diconv=external \
      -Db_lundef=false \
ninja
# install
install
ninja install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
