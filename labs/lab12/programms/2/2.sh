#!/bin/bash
cd /usr/share/man/man1
if (test -f $1.l.gz)
then less $1.l.gz
else echo "doesn't exist"
fi
