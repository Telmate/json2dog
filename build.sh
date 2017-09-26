#!/bin/bash

#Requires: git, fpm

# load lib
. /build/utils.sh

# constants
PKGNAME="json2dog"
# TODO: fill in deps
DEPS=(libjson-perl libwww-perl)

# local testing mode
if [[ -z "$BUILDDIR" ]]; then
	BUILDDIR=/tmp/build-json2dog
	echo "DEBUG: local mode with $BUILDDIR"
	PATH="$PATH:/home/chicks/.gem/ruby/1.9.1/bin"
	which fpm
	sleep 1
	mkdir $BUILDDIR 2> /dev/null
fi

# start at the beginning
cd ${BUILDDIR}

# make a dir tree
TREE=${BUILDDIR}/buildroot
rm -rf $TREE json2dog
mkdir $TREE $TREE/opt $TREE/opt/json2dog
mkdir -p $TREE/etc/init.d
mkdir -p $TREE/etc/default

# get source
git clone https://github.com/Telmate/json2dog.git 
cd json2dog

# which tag?
LATEST_TAG=$(git describe --abbrev=0 --tags)
LATEST_TAG=${LATEST_TAG#v}

# releaseo
mver ${PKGNAME} ${LATEST_TAG}

OUTDEB=${PKGNAME}_${LATEST_TAG}-${MVER}_amd64.deb

# build dependancy list
ARG_DEPS=""
for item in "${DEPS[@]}"
do
	ARG_DEPS="$ARG_DEPS -d ${item}"
done
echo ARG_DEPS=${ARG_DEPS} TREE=${TREE} OUTDEB=${OUTDEB}

# trace rest of script
set -x

# cp things into place
cp -R json2dog lib ${TREE}
cp init.d/json2dog.ubu14 $TREE/etc/init.d/json2dog
cp init.d/etc_default_json2dog.ubu14 $TREE/etc/default/json2dog

# package it
#echo TREE=${TREE}
cd ${BUILDDIR}
fpm -s dir -t deb -n ${PKGNAME} -v ${LATEST_TAG} ${ARG_DEPS} --iteration ${MVER} -C ${TREE} opt etc

echo ""
cd ${BUILDDIR}
ls -lh $OUTDEB
echo ""
ls -lh
dpkg -c $OUTDEB
updaterepo `readlink -f $OUTDEB`


