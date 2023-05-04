#!/usr/bin/env bash
#VERSION=0.3
# Use bubblewrap to run /bin/sh reusing the host OS binaries (/usr), but with
# separate /tmp, /home, /var, /run, and /etc. For /etc we just inherit the
# host's resolv.conf, and set up "stub" passwd/group files.

set -euo pipefail
(exec -a jailshell bwrap --ro-bind /usr /usr \
      --ro-bind /lib /lib \
      --ro-bind-try /lib64 /lib64 \
      --tmpfs /usr/lib/modules \
      --tmpfs /usr/lib/systemd \
      --ro-bind /bin /bin \
      --ro-bind /sbin /sbin \
      --dir /var \
      --dir /tmp \
      --symlink ../tmp var/tmp \
      --proc /proc \
      --dev /dev \
      --bind ${HOME} ${HOME} \
      --ro-bind-try /etc/localtime /etc/localtime \
      --ro-bind-try /etc/ld.so.cache /etc/ld.so.cache \
      --ro-bind-try /etc/resolv.conf /etc/resolv.conf \
      --ro-bind-try /etc/exim.jail/${USER}.conf /etc/exim.conf \
      --ro-bind-try /etc/ssl /etc/ssl \
      --ro-bind-try /etc/pki /etc/pki \
      --ro-bind-try /etc/man_db.conf /etc/man_db.conf \
      --ro-bind-try /etc/services /etc/services \
      --bind-try /tmp/mysql.sock /tmp/mysql.sock \
      --bind-try /var/lib/mysql/mysql.sock /tmp/mysql.sock \
      --bind-try /var/lib/mysql/mysql.sock /var/lib/mysql/mysql.sock \
      --bind-try /home/mysql/mysql.sock /home/mysql/mysql.sock \
      --dir /var/spool/exim \
      --chdir ${HOME} \
      --unshare-all \
      --share-net \
      --die-with-parent \
      --dir /run/user/$(id -u) \
      --setenv XDG_RUNTIME_DIR "/run/user/$(id -u)" \
      --setenv PS1 "$(id -nu)$ " \
      --file 11 /etc/passwd \
      --file 12 /etc/group \
      /bin/bash -l "$@") \
      11< <(getent passwd $UID mail majordomo apache diradmin nobody root) \
      12< <(getent group $(id -g) mail majordomo apache diradmin nobody root daemon)
