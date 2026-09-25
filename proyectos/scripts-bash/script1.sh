#!/bin/bash

mkdir -p filedir

for i in $(seq 1 10)
do
    touch "filedir/file$i"
done

ls -l filedir/