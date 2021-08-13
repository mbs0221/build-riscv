#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=acl
export VERSION=2.2.52
export URL=http://download.savannah.gnu.org/releases/acl/acl-2.2.52.src.tar.gz
export SOURCE=acl-2.2.52.src.tar.gz
#description
#pre
#post
#prep
#wget http://download.savannah.gnu.org/releases/acl/acl-2.2.52.src.tar.gz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
#build
cd $__build_dir_
make clean && make -j$(nproc)
#install
cd $__build_dir_
make install install-lib
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_