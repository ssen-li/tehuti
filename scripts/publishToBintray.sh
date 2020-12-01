#!/usr/bin/env bash

result=${PWD##*/}
if [[ "$result" = "scripts" ]]
then
    echo "script must be run from root project folder, not $PWD"
    exit 1
else
    echo "we are in $PWD and tag is $SOURCE_TAG"

    if [[ $SOURCE_TAG =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
    then
        echo "tag $SOURCE_TAG looks like a semver so proceeding with bintray publish"
        git status
        git describe --tags
        ./gradlew bintrayUpload
    else
        echo "tag $SOURCE_TAG is NOT a valid semantic version (x.y.z) so not publishing to bintray"
    fi
fi
