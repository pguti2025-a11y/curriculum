#!/bin/bash

for i in $(seq 1 30)
do
    vector[$i]=$((RANDOM % 100 + 1))
done

for valor in "${vector[@]}"
do
    echo -n "$valor "
done
echo ""