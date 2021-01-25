#!/bin/sh
if [[ ! -r src/${1} ]]; then
  echo "file not found: ${1}"
  exit 1
fi

if [[ $MERMAID_ENABLED == "yes" ]]
then
    docker run --rm \
      -v ${PWD}/src/${1}:/mnt/src/\
      -v ${PWD}/images/:/mnt/images/\
      -v ${PWD}/out/:/mnt/out/ \
      -e DATE=$(git log -1 --date=short --format=%cd) \
      nicolasvion/mermaid ${1} ${2}
fi

if [[ $CSV_ENABLED == "yes" ]]
then
    docker run --rm \
      -v ${PWD}/src/${1}:/mnt/src/\
      -v ${PWD}/images/:/mnt/images/\
      -v ${PWD}/out/:/mnt/out/ \
      -e DATE=$(git log -1 --date=short --format=%cd) \
      nicolasvion/csvtomd ${1} ${2}
fi

if [[ $BUILD_ENABLED == "yes" ]]
then
    docker run --rm \
      -v ${PWD}/src/${1}:/mnt/src/\
      -v ${PWD}/images/:/mnt/images/\
      -v ${PWD}/out/:/mnt/out/ \
      -e DATE=$(git log -1 --date=short --format=%cd) \
      nicolasvion/pandoc ${1} ${2}
fi
