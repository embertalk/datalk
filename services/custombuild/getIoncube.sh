#!/bin/sh

if [ "$#" -eq 0 ]; then
	echo "Usage:";
	echo "  $0 4.6.0";
	exit 0;
fi

VER=$1

SET=0
if [ "${0##*/}" = "setIoncube.sh" ]; then
	SET=1
fi

SERVER=http://downloads3.ioncube.com/loader_downloads
gl()
{
	LOADER=ioncube_loaders_${1}.tar.gz

	if [ "$SET" -eq 1 ]; then
		F=ioncube_${VER}/${LOADER}
		if [ ! -s ${F} ]; then
			echo "Cannot find ${F} for linking";
			return;
		fi

		echo "linking $LOADER";
		rm -f ${LOADER}
		ln -sf ${F} ./${LOADER}
		return;
	fi

	D=ioncube_${VER}
	F=${D}/${LOADER}

	mkdir -p $D

	wget -O ${F}.temp $SERVER/$LOADER

	if [ ! -s ${F}.temp ]; then
		echo "${F}.temp is empty! Not copying.";
		rm -f ${F}.temp

		return
	fi

	cp -f ${F}.temp ${F}
	rm -f ${F}.temp
}

#gl lin_x86
gl lin_x86-64
gl lin_aarch64
#gl fre_4_x86
#gl fre_6_x86
#gl fre_7_x86
#gl fre_7_x86-64
#gl fre_8_x86-64
#gl fre_9_x86-64
#gl fre_9_x86
gl fre_11_x86-64

ls -la ioncube_loaders_*

echo "";
echo "dont forget to run:"
echo "./setIoncube.sh ${VER}";
echo "./create_versions.sh";

exit 0;
