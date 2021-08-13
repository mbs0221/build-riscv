#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libsoup
export VERSION=2.72.0
export URL=https://download.gnome.org/sources/libsoup/2.72/libsoup-2.72.0.tar.xz
export SOURCE=libsoup-2.72.0.tar.xz
#wget https://download.gnome.org/sources/libsoup/2.72/libsoup-2.72.0.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
