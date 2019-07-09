#! /bin/bash

npm install

node build/swagger/openapiToSwagger.js

mkdir -p shutterstock_dist

docker run --rm \
	   -v $(pwd):/opt/node-sdk \
	   -w /opt/node-sdk \
	   swaggerapi/swagger-codegen-cli:2.4.2 generate -i ./swagger2.json -o ./shutterstock_dist -c ./build/sdk/py/config.json -l python

pushd shutterstock_dist
git checkout -- git_push.sh
popd
