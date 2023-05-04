#!/bin/sh
#VERSION=1.5

#Place this into a cron location, such as:
#/etc/cron.weekly/sa-update.sh
#and chmod to 700

LOG=/var/log/sa-update.log
PID=/var/run/spamd.pid

OS=`uname`

if [ -s ${LOG} ]; then
	if [ -e ${LOG}.2 ]; then
		rm -f ${LOG}.2
	fi
	if [ -e ${LOG}.1 ]; then
		mv -f ${LOG}.1 ${LOG}.2
	fi
	mv -f ${LOG} ${LOG}.1
fi 

# Systemd checks
SYSTEMD=no
if [ -d ${SYSTEMDDIR} ]; then
	if [ -e /bin/systemctl ] || [ -e /usr/bin/systemctl ]; then
		SYSTEMD=yes
	fi
fi

# init.d scripts
INITDDIR=/etc/init.d
if [ "${OS}" = "FreeBSD" ]; then
	INITDDIR=/usr/local/etc/rc.d
fi

#/usr/bin/sa-update -D --nogpg --channel sought.rules.yerp.org --channel updates.spamassassin.org > ${LOG} 2>&1
/usr/bin/sa-update -D --nogpg --channel updates.spamassassin.org > ${LOG} 2>&1

RET=$?

if [ "$RET" -ge 4 ]; then
	echo "Error updating SpamAssassin Rules. Code=$RET";
	echo "";
	cat $LOG
else
	if [ "${SYSTEMD}" = "yes" ]; then
		systemctl stop spamassassin.service >> ${LOG} 2>&1
	fi

	if [ -s $PID ]; then
		ps -p `cat $PID` > /dev/null 2>&1
		if [ "$?" -eq 0 ]; then
			kill -9 `cat $PID` > /dev/null 2>&1
		fi
	else
		killall -9 spamd >/dev/null 2>&1
	fi

	if [ "${SYSTEMD}" = "yes" ]; then
		systemctl start spamassassin.service >> ${LOG} 2>&1
	else
		${INITDDIR}/exim restart >> ${LOG} 2>&1
	fi
fi

if [ "$RET" -eq 1 ]; then
	RET=0
fi

exit $RET;

