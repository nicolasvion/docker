#!/bin/bash

cd /data
for i in $(ls -1 *.mmd)
do
    mermaid  -t /usr/local/lib/node_modules/mermaid/dist/mermaid.forest.css -p $i
    cp -v /data/$i.png /mnt
done
