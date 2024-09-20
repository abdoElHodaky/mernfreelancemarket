#!/usr/bin/bash

cd client && npm install --force && \
npm run build && mkdir ../server/server/public && \
cp -r ./dist ../server/public


