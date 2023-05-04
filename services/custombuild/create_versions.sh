#!/bin/sh

VFILE=./versions.txt
T=${VFILE}.temp

GOOD=1

add()
{
	#$1 is the entry index
	#$2 is the version
	#$3 is the filename prefix, it's optional, else $1 is used.

	FILE=$1-$2.tar.gz

	MD5=""

#	if [ "$3" != "nomd5" ]; then
#		if [ "$#" -ne '2' ]; then
#			FILE=$3
#		fi
#
#		if [ ! -e $FILE ]; then
#			echo "missing: $FILE";
#			GOOD=0
#			return;
#		fi
#	
#		MD5=`md5sum $FILE | cut -d\  -f1`
#	else
#		MD5="";
#	fi

	echo "$1:$2:$MD5" >> $T;
}


echo -n '' > $T

#add date `date +%s` nomd5

IMAP_VER=2007f
add imap $IMAP_VER ../all/imap/imap-${IMAP_VER}.tar.gz

CWAF_RULES_VER=1.233
add cwaf_rules $CWAF_RULES_VER cwaf/cwaf_rules-${CWAF_RULES_VER}.tgz

LITESPEED_VER=6.0.12
add litespeed $LITESPEED_VER litespeed/lsws-${LITESPEED_VER}-ent-x86_64-linux.tar.gz

LE_VER=2.0.30
add letsencrypt_sh $LE_VER ../all/letsencrypt/letsencrypt.sh.${LE_VER}

#add autoconf 2.61
#62 and 63 were skipped, try 64
#add autoconf 2.67
#add autoconf 2.69

#Dec 17,2009 tried 1.11.1 from 1.10.2
#add automake 1.16.1

##################################################################################
APACHE24=2.4.54
add apache2.4 ${APACHE24} httpd-${APACHE24}.tar.gz

#add httpd_2_boot 2.7 httpd_2
#add httpd_2_boot_debian 1 httpd_2_debian
#add httpd_2_boot_freebsd 1 httpd_2_freebsd

#ZSTD_VER=1.5.1
#add zstd ${ZSTD_VER} zstd/zstd-${ZSTD_VER}.tar.gz

FTS_XAPIAN_VER=1.5.5
add fts-xapian ${FTS_XAPIAN_VER} xapian/fts-xapian-${FTS_XAPIAN_VER}.tar.gz
XAPIAN_CORE_VER=1.4.20
add xapian-core ${XAPIAN_CORE_VER} xapian/xapian-core-${XAPIAN_CORE_VER}.tar.xz

IMAPSYNC_VER=2.178
add imapsync ${IMAPSYNC_VER} imapsync/imapsync-${IMAPSYNC_VER}.tar.gz

MSMTP_VER=1.8.19
add msmtp ${MSMTP_VER} msmtp/msmtp-${MSMTP_VER}.tar.xz

BUBBLEWRAP_VER=0.6.2
add bubblewrap ${BUBBLEWRAP_VER} bubblewrap/bubblewrap-${BUBBLEWRAP_VER}.tar.xz

JAILSHELL_VER=0.6
add jailshell_sh $JAILSHELL_VER bubblewrap/jailshell-${JAILSHELL_VER}.sh

#NGHTTP2_VER=1.48.0
#add nghttp2 ${NGHTTP2_VER}

#1.7.0 has issues with getrandom syscall on lxc/openvz when OS is new/kernel old, thus CB does auto-downgrade to 1.6.5
add apr 1.7.0

#1.5.1 breaks $1$ passwords.
#fixed in DA for newly set passwords, but doesn't help old ones. 1.4.1 for now.
#http://forum.directadmin.com/showthread.php?t=45790&p=234394#post234394
add apr-util 1.6.1

#add harden-symlinks-2.4-patch 2.4 harden-symlinks-2.4.patch
#add mod_suexec_directory 1.0 patches/mod_suexec_directory.patch

##################################################################################
MOD_SEC_VER=2.9.6
add modsecurity ${MOD_SEC_VER}
MOD_SEC3_VER=3.0.8
add modsecurity3 ${MOD_SEC3_VER} modsecurity-v${MOD_SEC3_VER}.tar.gz

MOD_SEC_APACHE=v0.0.9-beta1
add modsecurity3_apache ${MOD_SEC_APACHE} modsecurity-apache-${MOD_SEC_APACHE}.tar.gz

MS_N_C_VER=v1.0.3
add modsecurity3_nginx ${MS_N_C_VER} modsecurity-nginx-${MS_N_C_VER}.tar.gz

MODSEC_SDBM_UTIL_VER=1.0
add modsec-sdbm-util ${MODSEC_SDBM_UTIL_VER}

#removed as per Martynas' request, no longer needed.
#OWASP_VER=2.2.9-5-gebe8790
#add owasp_rules ${OWASP_VER} SpiderLabs-owasp-modsecurity-crs-${OWASP_VER}.tar.gz

OWASP3_VER=3.3.2
add owasp3_rules ${OWASP3_VER} owasp-modsecurity-crs-${OWASP3_VER}.tar.gz

MAXMINDB_VER=1.6.0
add libmaxminddb ${MAXMINDB_VER}
GEOIPUPDATE_VER=3.1.1
add geoipupdate ${GEOIPUPDATE_VER}

##################################################################################

#ONLY use the Mainline version
#NGINX_VER=1.13.12
#1.21.5+ breaks modsecurity if no --without-pcre2 config flag
NGINX_VER=1.23.1
add nginx ${NGINX_VER}
NGINX_MAINLINE_VER=${NGINX_VER}
add nginx_mainline ${NGINX_MAINLINE_VER} nginx-${NGINX_MAINLINE_VER}.tar.gz
NGX_CACHE_PURGE=2.3
add ngx_cache_purge ${NGX_CACHE_PURGE} ngx_cache_purge-${NGX_CACHE_PURGE}.tar.gz
#add nginx_boot 1 nginx.boot
#add nginx_boot_freebsd 2.0 nginx.boot.freebsd
#add nginx_boot_debian 1 nginx.boot.debian

#add unit_boot 1 unit.boot
#add unit_boot_freebsd 1 unit.boot.freebsd

add mod_aclr2 1.0.0

UNIT_VER=1.28.0
add unit ${UNIT_VER} unit/unit-${UNIT_VER}.tar.gz

OPEN_LS_VER=1.7.16
add openlitespeed ${OPEN_LS_VER} openlitespeed/openlitespeed-${OPEN_LS_VER}.tgz
add openlitespeed_src ${OPEN_LS_VER} openlitespeed/openlitespeed-${OPEN_LS_VER}.src.tgz

#SQLITE_VER=3310000
#add sqlite ${SQLITE_VER} sqlite/sqlite-autoconf-${SQLITE_VER}.tar.gz

COMPOSER_VER=2.4.1
add composer ${COMPOSER_VER} composer/${COMPOSER_VER}/composer.phar

WP_VER=2.6.0
add wp-cli ${WP_VER} wp/${WP_VER}/wp-cli.phar

LEGO_VER=953d5c85145b6a2b9a52f2d919faf23e04a359b3
add lego ${LEGO_VER} lego/lego_v${LEGO_VER}_linux_amd64.tar.gz
#add lego_386 ${LEGO_VER} lego/lego_v${LEGO_VER}_linux_386.tar.gz
add lego_arm64 ${LEGO_VER} lego/lego_v${LEGO_VER}_linux_arm64.tar.gz
#add lego_freebsd ${LEGO_VER} lego/lego_v${LEGO_VER}_freebsd_amd64.tar.gz

DNSPROVIDERS_VER=4.5.3
add dnsproviders ${DNSPROVIDERS_VER} lego/dnsproviders-${DNSPROVIDERS_VER}.json

LUA_VER=5.3.5
add lua ${LUA_VER} lua/lua-${LUA_VER}.tar.gz

S_NAIL_VER=14.9.23
add s-nail ${S_NAIL_VER} s-nail/s-nail-${S_NAIL_VER}.tar.gz

#AW_VER=7.1.1
AW_VER=7.8
#7.0/7.1 bug? http://www.directadmin.com/forum/showthread.php?p=193914#post193914
#AW_VER=6.95
add awstats $AW_VER ../all/awstats/awstats-${AW_VER}.tar.gz
add awstats_process 2.9 ../all/awstats/awstats_process.sh-2.9

add curl 7.85.0

DOVECOT_VER=2.3.19.1
add dovecot ${DOVECOT_VER}
PIGEON23_VER=0.5.19
add pigeonhole23 ${PIGEON23_VER} dovecot-2.3-pigeonhole-${PIGEON23_VER}.tar.gz
#DOVE_PIGEON_VER=1.1
#add dovecotpigeonholepatch ${DOVE_PIGEON_VER} patches/dovecot.conf.pigeonhole.patch-${DOVE_PIGEON_VER}
#add dovecot_boot 1 dovecot.boot
#add dovecot_boot_freebsd 1 dovecot.boot.freebsd
#add dovecot_boot_debian 1 dovecot.boot.debian
#add dovecot_logrotate 1 dovecot.logrotate
add libspf2 1.2.11

add exim 4.96
#add exim_boot 1 exim
#add exim_boot_freebsd 1 exim_freebsd
#add exim_boot_debian 1 exim_debian
add system_filter_exim 1.3 ../system_filter.exim
add eximspamconf 1.4 ../exim.spamassassin.conf
add eximclamavconf 1.4 ../exim.clamav.conf
add eximclamavloadconf 1.1 ../exim.clamav.load.conf
add clamav 0.104.4
#add mod_clamav_c 0.13 mod_clamav.c
#add mod_clamav_h 0.13 mod_clamav.h

EXIM_CONF_45=4.5.42
add exim_conf_45 ${EXIM_CONF_45} ../SpamBlocker/${EXIM_CONF_45}/exim.conf-SpamBlockerTechnology-v${EXIM_CONF_45}.txt

#EXIM_CONF_46=4.6.0
#add exim_conf_46 ${EXIM_CONF_46} ../SpamBlocker/${EXIM_CONF_46}/exim.conf-SpamBlockerTechnology-v${EXIM_CONF_46}.txt

BC_VER=1.12
add blockcracking ${BC_VER} ../blockcracking/exim.blockcracking-${BC_VER}.tar.gz
#ln -sf ../blockcracking/exim.blockcracking-${BC_VER}.tar.gz .

EASY_SPAM_FIGHTER_VER=1.32
add easy_spam_figther ${EASY_SPAM_FIGHTER_VER} ../easy_spam_fighter/exim.easy_spam_fighter-${EASY_SPAM_FIGHTER_VER}.tar.gz
#ln -sf ../easy_spam_fighter/exim.easy_spam_fighter-${EASY_SPAM_FIGHTER_VER}.tar.gz .

#CHECK_DMARC_VER=1.0
#add check_dmarc ${CHECK_DMARC_VER} ../easy_spam_fighter/dmarc/check_dmarc/check_dmarc-${CHECK_DMARC_VER}.conf
#DMARC_CRON_VER=1.0
#add dmarc_cron ${DMARC_CRON_VER} ../easy_spam_fighter/dmarc/cron/dmarc_cron-${DMARC_CRON_VER}

add exim_pl_45 32 ../exim.pl.32
#add exim_pl_46 31 ../exim.pl.31

DKIM_CONF_VER=1.7
add exim_dkim_conf ${DKIM_CONF_VER} ../exim.dkim.conf.${DKIM_CONF_VER}

#add icu4c 64_2 icu4c-64_2-src.tgz
#add icu4c 66_1 icu4c-66_1-src.tgz

#add freetype 2.3.12
#add freetype 2.4.12
#2.5.0 points to 2.5.0.1 because of packaging error, and they didn't update version number.
#add freetype 2.5.5
#add freetype 2.10.4

#PNG_CURRENT_VER=1.6.37
#add libpng_current ${PNG_CURRENT_VER} libpng-${PNG_CURRENT_VER}.tar.gz

IMAGICK_VER=3.7.0
add imagick $IMAGICK_VER imagick/imagick-${IMAGICK_VER}.tgz

PHALCON_VER=4.1.2
add phalcon $PHALCON_VER php_extensions/phalcon/phalcon-${PHALCON_VER}.tgz

SNUFFLEUPAGUS_VER=0.7.1
add snuffleupagus ${SNUFFLEUPAGUS_VER} php_extensions/snuffleupagus/snuffleupagus-${SNUFFLEUPAGUS_VER}.tar.gz

IGBINARY_VER=3.2.7
add igbinary ${IGBINARY_VER} php_extensions/igbinary/igbinary-${IGBINARY_VER}.tar.gz

PHPREDIS_VER=5.3.7
add phpredis ${PHPREDIS_VER} php_extensions/redis/redis-${PHPREDIS_VER}.tgz

XMLRPC_VER=1.0.0RC3
add xmlrpc ${XMLRPC_VER} php_extensions/xmlrpc/xmlrpc-${XMLRPC_VER}.tgz

PSR_VER=1.2.0
add psr $PSR_VER php_extensions/psr/psr-${PSR_VER}.tgz

#7.0.10-54 and newer fail on CentOS7 with:
#MagickCore/.libs/libMagickCore-7.Q16HDRI.so: undefined reference to `WebPMemoryWriterClear'
IMAGEMAGICK_VER=7.1.0-24
add imagemagick $IMAGEMAGICK_VER imagick/ImageMagick-${IMAGEMAGICK_VER}.tar.gz

REDIS_VER=7.0.4
add redis $REDIS_VER redis/redis-${REDIS_VER}.tar.gz

#XML2_VER=2.9.10
#add libxml2-current $XML2_VER libxml2-${XML2_VER}.tar.gz

#PIGZ_VER=2.4
#add pigz ${PIGZ_VER}

LIBZIP_VER=1.7.3
add libzip ${LIBZIP_VER}

#was 1.1.30 to 1.1.32
#failed on CentOS 6, odd.
#In file included from xslt.c:17In file included from variables.c:13:
#libxslt.h:20:31:libxslt.h:20:31:  error: error: libxml/xmlversion.h: No such file or directorylibxml/xmlversion.h: No such file or directory
#add libxslt 1.1.34

#add mysqld_boot_freebsd 1 mysqld_freebsd

MYSQL55VER=5.5.62
#MYSQL55_RELEASE=1
add mysql5.5 $MYSQL55VER ../all/mysql/5.5/${MYSQL55VER}/mysql-$MYSQL55VER.tar.gz
#add mysql5.5_release $MYSQL55_RELEASE nomd5

MYSQL56VER=5.6.51
#MYSQL56_RELEASE=1
add mysql5.6 $MYSQL56VER ../all/mysql/5.6/${MYSQL56VER}/mysql-$MYSQL56VER.tar.gz
#add mysql5.6_release $MYSQL56_RELEASE nomd5

MYSQL57VER=5.7.39
#MYSQL57_RELEASE=1
add mysql5.7 $MYSQL57VER ../all/mysql/5.7/${MYSQL57VER}/mysql-$MYSQL57VER.tar.gz
#add mysql5.7_release $MYSQL57_RELEASE nomd5

MYSQL80VER=8.0.30
#MYSQL80_RELEASE=1
add mysql8.0 $MYSQL80VER ../all/mysql/8.0/${MYSQL80VER}/mysql-$MYSQL80VER.tar.gz
#add mysql8.0_release $MYSQL80_RELEASE nomd5

MARIADB55VER=5.5.68
add mariadb5.5 ${MARIADB55VER} ../all/mariadb/5.5/${MARIADB55VER}/mariadb-${MARIADB55VER}.tar.gz

MARIADB100VER=10.0.38
add mariadb10.0 ${MARIADB100VER} ../all/mariadb/10.0/${MARIADB100VER}/mariadb-${MARIADB100VER}.tar.gz

MARIADB101VER=10.1.48
add mariadb10.1 ${MARIADB101VER} ../all/mariadb/10.1/${MARIADB101VER}/mariadb-${MARIADB101VER}.tar.gz

MARIADB102VER=10.2.44
add mariadb10.2 ${MARIADB102VER} ../all/mariadb/10.2/${MARIADB102VER}/mariadb-${MARIADB102VER}.tar.gz

MARIADB103VER=10.3.36
add mariadb10.3 ${MARIADB103VER} ../all/mariadb/10.3/${MARIADB103VER}/mariadb-${MARIADB103VER}.tar.gz

MARIADB104VER=10.4.26
add mariadb10.4 ${MARIADB104VER} ../all/mariadb/10.4/${MARIADB104VER}/mariadb-${MARIADB104VER}.tar.gz

MARIADB105VER=10.5.17
add mariadb10.5 ${MARIADB105VER} ../all/mariadb/10.5/${MARIADB105VER}/mariadb-${MARIADB105VER}.tar.gz

MARIADB106VER=10.6.9
add mariadb10.6 ${MARIADB106VER} ../all/mariadb/10.6/${MARIADB106VER}/mariadb-${MARIADB106VER}.tar.gz

JEMALLOC_VER=3.6.0
add jemalloc_versions ${JEMALLOC_VER} ../all/mariadb/jemalloc/jemalloc_versions.txt

#GALERA_VER=25.3.27
GALERA_VER=26.4.8
add galera_versions ${GALERA_VER} ../all/mariadb/galera/galera_versions.txt

#7.9
#add pcre 8.13
#add pcre 8.20
#add pcre 8.30 #this one creates libpcre.so.1, but old one is libpcre.so.0, so have to link to it.
#also can't use 8.30 until php is updated anyway:
#https://bugs.php.net/bug.php?id=60986
#PCRE_VER=8.44
#add pcre_current $PCRE_VER pcre-$PCRE_VER.tar.gz
#PCRE2_VER=10.35
#add pcre2 ${PCRE2_VER}

PHP53_VER=5.3.29
add php53 $PHP53_VER php-$PHP53_VER.tar.gz
#add php53x-mail 5.3.x php-5.3.x-mail-header.patch  #removed october 27, 2012

PHP54_VER=5.4.45
add php54 $PHP54_VER php-${PHP54_VER}.tar.gz

PHP55_VER=5.5.38
add php55 $PHP55_VER php-${PHP55_VER}.tar.gz

PHP56_VER=5.6.40
add php56 $PHP56_VER php-${PHP56_VER}.tar.gz

PHP70_VER=7.0.33
#7.0.20 bug: ticket 7405
add php70 $PHP70_VER php-${PHP70_VER}.tar.gz

PHP71_VER=7.1.33
add php71 $PHP71_VER php-${PHP71_VER}.tar.gz

PHP72_VER=7.2.34
add php72 $PHP72_VER php-${PHP72_VER}.tar.gz

PHP73_VER=7.3.33
add php73 $PHP73_VER php-${PHP73_VER}.tar.gz

PHP74_VER=7.4.30
add php74 $PHP74_VER php-${PHP74_VER}.tar.gz

PHP80_VER=8.0.23
add php80 $PHP80_VER php-${PHP80_VER}.tar.gz

PHP81_VER=8.1.10
add php81 $PHP81_VER php-${PHP81_VER}.tar.gz

PHP82_VER=8.2.0RC1
add php82 $PHP82_VER php-${PHP82_VER}.tar.gz

#==========================================
#LIBSODIUM_VER=1.0.18
#add libsodium $LIBSODIUM_VER





#==========================================

PMA4_VER=4.9.10-all-languages
add phpmyadmin4 $PMA4_VER ../all/phpMyAdmin/phpMyAdmin-$PMA4_VER.tar.gz

PMA5_VER=5.2.0-all-languages
add phpmyadmin5 $PMA5_VER ../all/phpMyAdmin/phpMyAdmin-$PMA5_VER.tar.gz

#the patches/pma_auth_logging-4.7.patch is in patches_versions.txt
#add phpmyadmin_auth_log_patch 1 patches/pma_auth_logging.patch

#was 1.3.2
add proftpd 1.3.7e
#add proftpd_boot 1 proftpd
#add proftpd_boot_debian 1 proftpd_debian
#add proftpd_boot_freebsd 1 proftpd_freebsd

NCFTP_VER=3.2.6
add ncftp ${NCFTP_VER} ../ncftp-${NCFTP_VER}-src.tar.gz


#http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-1.0.29.tar.gz
PURE_VER=1.0.49
add pureftpd ${PURE_VER} pure-ftpd-${PURE_VER}.tar.gz
#add pure-ftpd_boot 1.1 pure-ftpd.1.1
#add pure-ftpd_boot_debian 1.1 pure-ftpd_debian.1.1
#add pure-ftpd_boot_freebsd 1.1 pure-ftpd_freebsd.1.1

RC_VER=1.6.0
add roundcubemail $RC_VER ../all/roundcube/roundcubemail-$RC_VER.tar.gz

#auto login / direct_login
RC_DIRECT_LOGIN_VER=0.8
add rc_direct_login ${RC_DIRECT_LOGIN_VER} ../all/auto_login/roundcube/roundcube_direct_login-${RC_DIRECT_LOGIN_VER}.tar.gz
PMA_DIRECT_LOGIN_VER=0.5
add pma_direct_login ${PMA_DIRECT_LOGIN_VER} ../all/auto_login/phpMyAdmin/phpMyAdmin_direct_login-${PMA_DIRECT_LOGIN_VER}.tar.gz

SPAM_VER=3.4.6
add spamassassin ${SPAM_VER} Mail-SpamAssassin-${SPAM_VER}.tar.gz

SA_UPDATE_SH=1.5
add sa-update-sh ${SA_UPDATE_SH} sa-update.sh

#SPAM_RULES_VER=${SPAM_VER}.r1840640
#SPAM_RULES_VER=${SPAM_VER}.r1871124
SPAM_RULES_VER=${SPAM_VER}.r1888502
SPAM_RULES_NAME=Mail-SpamAssassin-rules-${SPAM_RULES_VER}.tgz
add spamassassin_rules ${SPAM_RULES_VER} ${SPAM_RULES_NAME}
#add spamassassin_rules_md5 ${SPAM_RULES_VER} ${SPAM_RULES_NAME}.md5
#add spamassassin_rules_asc ${SPAM_RULES_VER} ${SPAM_RULES_NAME}.asc
#add spamassassin_rules_sha1 ${SPAM_RULES_VER} ${SPAM_RULES_NAME}.sha1
#uses sha256/sha512 now, but not used in CB

add rspamd 1.8.1
#add rspamd_boot 1 rspamd
#add rspamd_debian_boot 1 rspamd_debian
#add rspamd_freebsd_boot 1 rspamd_freebsd

RSPAMD_CONF_VER=0.4
add rspamd_conf ${RSPAMD_CONF_VER} ../easy_spam_fighter/rspamd/${RSPAMD_CONF_VER}/rspamd_conf-${RSPAMD_CONF_VER}.tar.gz

SQUIRREL_VER=1.4.22
add squirrelmail ${SQUIRREL_VER} ../all/squirrelmail-${SQUIRREL_VER}.tar.gz

#SQUIRREL_SVN_VER=1.4.22-20140402_0200
#SQUIRREL_SVN_VER=1.4.23-20150507_0200
#SQUIRREL_SVN_VER=1.4.23-20170731_0200
#SQUIRREL_SVN_VER=1.4.23-20180516_0203
SQUIRREL_SVN_VER=1.4.23-20220318_0200
add squirrelmail_svn ${SQUIRREL_SVN_VER} ../all/squirrelmail-${SQUIRREL_SVN_VER}.tar.gz

SM_LOCALE=1.4.18-20090526
add squirrelmail_locale ${SM_LOCALE} ../all/squirrelmail/locales/all_locales-${SM_LOCALE}.tar.gz

SM_LOGGER=2.3.1-1.2.7
add squirrel_logger ${SM_LOGGER} ../all/squirrelmail/squirrel_logger/squirrel_logger-${SM_LOGGER}.tar.gz

#add webapps_logrotate 1 webapps.logrotate

add mod_fcgid 2.3.9
add fcgid_sh 1.0 fcgid.sh

HTSCANNER_VER=1.0.1-enhanced
add htscanner ${HTSCANNER_VER} htscanner-${HTSCANNER_VER}.tgz

RUID2_VER=0.9.8
add mod_ruid2 ${RUID2_VER} mod_ruid2-${RUID2_VER}.tar.bz2

#add php53_apache-fpm_patch 1.0 patches/php-5.3.28_apache-2.4.10-fpm.patch

#add apache_suexec_safe 1.0 patches/suexec-safe.patch

add curl_cacert 20161102 ../all/ssl/cacert.pem

#add libevent 2.0.16-stable  #removed October 27, 2012

#for 0.7.2: https://lists.marsching.com/pipermail/suphp/2013-June.txt
add suphp 0.7.1
add suphp_current 0.7.2 suphp-0.7.2.tar.gz
#add suphp_attachment_patch 1.0 patches/suphp_attachment.patch
#add suphp_attachment_diff 1.0 patches/suphp_attachment.diff
#add suphp_calling_user_patch 1.0 patches/suphp_calling_user.patch
#add suphp_script_name_patch 1.0 patches/suphp_script_name.patch

add webalizer 2.23-09 webalizer-2.23-09-src.tgz

ZEND_OC_VER=7.0.5
add zendopcache ${ZEND_OC_VER} zendopcache-${ZEND_OC_VER}.tgz

#add ioncube_loaders_fre_4_x86 4.0.14 ioncube_loaders_fre_4_x86.tar.gz
#IONCUBE_VER=5.0.20
IONCUBE_VER=12.0.2
#add ioncube_loaders_fre_6_x86 ${IONCUBE_VER} ioncube_loaders_fre_6_x86.tar.gz
#add ioncube_loaders_fre_7_x86-64 ${IONCUBE_VER} ioncube_loaders_fre_7_x86-64.tar.gz
#add ioncube_loaders_fre_7_x86 ${IONCUBE_VER} ioncube_loaders_fre_7_x86.tar.gz
#add ioncube_loaders_fre_8_x86-64 ${IONCUBE_VER} ioncube_loaders_fre_8_x86-64.tar.gz
#add ioncube_loaders_fre_9_x86-64 ${IONCUBE_VER} ioncube_loaders_fre_9_x86-64.tar.gz
#add ioncube_loaders_fre_9_x86 ${IONCUBE_VER} ioncube_loaders_fre_9_x86.tar.gz
#add ioncube_loaders_fre_11_x86-64 ${IONCUBE_VER} ioncube_loaders_fre_11_x86-64.tar.gz
add ioncube_loaders_lin_x86-64 ${IONCUBE_VER} ioncube_loaders_lin_x86-64.tar.gz
#add ioncube_loaders_lin_x86 ${IONCUBE_VER} ioncube_loaders_lin_x86.tar.gz
add ioncube_loaders_lin_aarch64 ${IONCUBE_VER} ioncube_loaders_lin_aarch64.tar.gz

SUHOSIN_VER=0.9.38
add suhosin ${SUHOSIN_VER} suhosin-${SUHOSIN_VER}.tar.gz

#1.2.4 breaks libxml2
#add zlib-current 1.2.11 zlib-1.2.11.tar.gz

#add servers 1 servers.txt

./patches_versions.sh
#add patches_versions 1 patches_versions.txt

#add cb_2_tar_gz 1 2.0/custombuild.tar.gz


if [ "${GOOD}" -eq 1 ]; then
	mv -f ${T} ${VFILE}

	./update_md5_list.sh ${VFILE} versions_md5.txt

	exit 0;
else
	echo "Failed creation of ${T}";
	echo "check $0";

	exit 1;
fi
