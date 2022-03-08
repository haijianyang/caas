#!/bin/bash

set -e

GV="$1"

# ./hack/generate_group.sh \
#   all \
#   caas.io/caas/client \
#   caas.io/caas/api \
#   cluster:v1 \
#   --go-header-file "$PWD/hack/boilerplate.go.txt"

rm -rf ./pkg/client
./hack/generate-groups.sh "client,lister,informer" caas.io/caas/pkg/client caas.io/caas/api "${GV}" --output-base=./  -h "$PWD/hack/boilerplate.go.txt"
mv caas.io/caas/pkg/client ./pkg/
rm -rf ./caas.io
