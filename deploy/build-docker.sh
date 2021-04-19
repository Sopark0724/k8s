#!/bin/bash
BUILD_PATH=build/dependency
PROJECT_ID=$1
VERSION=$2
mkdir -p $BUILD_PATH && (cd $BUILD_PATH; jar -xf ../libs/*.jar)

docker build -t gcr.io/$PROJECT_ID/hello-app:$VERSION .

docker push gcr.io/$PROJECT_ID/hello-app:$VERSION
