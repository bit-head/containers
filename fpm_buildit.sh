#!/bin/bash

set -x

type=$1

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind

fpm -s dir -t ${type} \
  -p pure-kind-0.17.0-amd64.${type} \
  --name pure-kind \
  --version 0.17.0 \
  --architecture amd64 \
  --description "Kind Binary for AMD64 packaged by DevTools" \
  --url "https://kind.sigs.k8s.io/docs/user/quick-start/#installation" \
  --maintainer "DevTools #ask-iss" \
  kind=/usr/local/bin/kind