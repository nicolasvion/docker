#!/bin/sh
if [[ ! -r src/${1} ]]; then
  echo "file not found: ${1}"
  exit 1
fi

if [[ $BUILD_ENABLED == "yes" ]]
then
    echo "Processing ${1} ..."
    for i in $(ls -1 images/${1}/ | grep .py)
    do
        docker run --rm \
        -v ${PWD}/src/${1}:/mnt/src/\
         -v ${PWD}/images/${1}:/mnt/images/\
         -v ${PWD}/out/:/mnt/out/ \
        -e DATE=$(git log -1 --date=short --format=%cd) \
        nicolasvion/diagrams:v0.1 $i ${2}
    done
    docker run --rm \
      -v ${PWD}/src/${1}:/mnt/src/\
      -v ${PWD}/images/${1}:/mnt/images/\
      -v ${PWD}/out/:/mnt/out/ \
      -e DATE=$(git log -1 --date=short --format=%cd) \
      nicolasvion/pandoc:v0.1 ${1} ${2}
fi
