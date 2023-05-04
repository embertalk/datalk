#!/bin/sh
#VER=3.3.2-r1104058
VER=3.4.1.r1675274
DL_HOST=http://apache.mirror.iweb.ca/spamassassin/source
SIG_HOST=http://www.apache.org/dist/spamassassin/source
EXT=tgz

getFile()
{
	wget -O $2 $1/$2

	if [ ! -s $2 ]; then
		echo "";
		echo "Error downloading $2 from $1";
		echo "";
	fi
}



getFile $DL_HOST Mail-SpamAssassin-rules-${VER}.${EXT}

getFile ${SIG_HOST} Mail-SpamAssassin-rules-${VER}.${EXT}.asc
getFile ${SIG_HOST} Mail-SpamAssassin-rules-${VER}.${EXT}.md5
getFile ${SIG_HOST} Mail-SpamAssassin-rules-${VER}.${EXT}.sha1


ls -la Mail-SpamAssassin-rules-${VER}.${EXT}*
