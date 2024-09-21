#!/usr/bin/bash

sh runclient.sh

cd ../api && npm i && \
node server.js
