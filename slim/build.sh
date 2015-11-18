#!/bin/sh

cd $(dirname $0)

container_id=$(docker run --detach dochang/cow:latest true)

docker cp ${container_id}:/go/bin/cow cow

docker rm --force ${container_id}

docker build --tag=dochang/cow:slim .
