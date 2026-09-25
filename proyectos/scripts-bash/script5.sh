#!/bin/bash

hora=$(date +%H)

if [ $hora -ge 7 ] && [ $hora -lt 14 ]
then
    echo "Buenos días"
elif [ $hora -ge 14 ] && [ $hora -lt 21 ]
then
    echo "Buenas tardes"
else
    echo "Buenas noches"
fi