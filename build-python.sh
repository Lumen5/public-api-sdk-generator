#! /bin/bash

npm install

node build/swagger/openapiToSwagger.js

mkdir -p storyblocks_dist

docker run --rm \
	   -v $(pwd):/opt/node-sdk \
	   -w /opt/node-sdk \
	   swaggerapi/swagger-codegen-cli:2.4.17 generate -i ./swagger2.json -o ./storyblocks_dist -c ./build/sdk/py/config.json -l python -t ./build/sdk/py/templates

pushd storyblocks_dist
git checkout -- git_push.sh
popd
