#!/bin/bash

PACKAGES=`adb shell pm list packages -f | cut -d ":" -f2`

for package in ${PACKAGES}; do
    apk=`echo ${package} | grep -Eo ".*\.apk"`
    pkg=`echo ${package} | rev | cut -d "=" -f1 | rev`
    [[ ${apk} =~ "/data"* ]] && adb pull "${apk}" "${PWD}/${pkg}.apk"
done
