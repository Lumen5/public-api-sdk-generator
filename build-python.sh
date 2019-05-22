#! /bin/bash

npm install

node build/swagger/openapiToSwagger.js

mkdir -p dist

docker run --rm \
	   -v $(pwd):/opt/node-sdk \
	   -w /opt/node-sdk \
	   swaggerapi/swagger-codegen-cli:2.4.2 generate -i ./swagger2.json -o ./dist -c ./build/sdk/py/config.json -l python
