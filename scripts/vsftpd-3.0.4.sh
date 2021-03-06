#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=vsftpd
export VERSION=3.0.4
# Release:        1%{?dist}
# Group:          Network
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://src.fedoraproject.org/repo/pkgs/lrzsz/lrzsz-0.12.20.tar.gz/b5ce6a74abc9b9eb2af94dffdfd372a4/lrzsz-0.12.20.tar.gz
export SOURCE=vsftpd-3.0.4.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
prep
# setup
setup
# build
build
sed -i '2c CC?=gcc' Makefile
make CC=riscv64-unknown-linux-gnu-gcc
# install
install
mkdir -p $BUILDROOT/etc
mkdir -p $BUILDROOT/usr/sbin/
mkdir -p $BUILDROOT/usr/man/man5
mkdir -p $BUILDROOT/usr/man/man8
install -m 755 vsftpd        $BUILDROOT/usr/sbin/vsftpd
install -m 644 vsftpd.conf.5 $BUILDROOT/usr/man/man5
install -m 644 vsftpd.8      $BUILDROOT/usr/man/man8
install -m 664 vsftpd.conf   $BUILDROOT/etc
# clean
clean

# %files
# path: /usr/
# %defattr(-,root,root,-)
# %config /etc/*
epilog
