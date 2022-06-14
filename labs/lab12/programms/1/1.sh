#!/bin/bash
lockfile="./lock.file"
exec {fn}>lockfile

echo "Locked"
until flock -n ${fn}
do
    echo "Not Locked"
    sleep 1
    flock -n ${fn}
done
for ((i=0; i<=7; i++))
do
    echo "work"
    sleep 1
done
