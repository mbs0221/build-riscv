#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=glibc
export VERSION=2.33
export URL=http://ftp.gnu.org/gnu/glibc/glibc-2.33.tar.xz
export SOURCE=glibc-2.33.tar.xz
#description
#pre
#post
#prep
#wget http://ftp.gnu.org/gnu/glibc/glibc-2.33.tar.xz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
mkdir build && cd build
../configure --prefix=$SYSROOT/ \
            --host=riscv64-unknown-linux-gnu \
#build
cd $__build_dir_
cd build
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
