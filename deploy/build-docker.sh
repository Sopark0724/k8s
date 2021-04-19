#!/bin/bash
BUILD_PATH=build/dependency
mkdir -p $BUILD_PATH && (cd $BUILD_PATH; jar -xf ../libs/*.jar)

BRANCH_NAME="$(git name-rev --name-only HEAD | awk -F/ '{print $NF}')"
COMMIT_HASH="$(git rev-parse --verify HEAD | awk '{print substr($0,0,7)}')"

docker build --build-arg DEPENDENCY=$BUILD_PATH -t idock.daumkakao.io/sharky_p/dkos-study:latest -t idock.daumkakao.io/sharky_p/dkos-study:master.$COMMIT_HASH .

docker login idock.daumkakao.io -u sharky.p -p 비밀번호
docker push idock.daumkakao.io/sharky_p/dkos-study

docker rmi idock.daumkakao.io/sharky_p/dkos-study:latest
docker rmi idock.daumkakao.io/sharky_p/dkos-study:master.$COMMIT_HASH
