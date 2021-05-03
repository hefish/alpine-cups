#!/bin/sh

echo "root:$ROOT_PASS" |chpasswd 

/usr/sbin/cupsd -f

