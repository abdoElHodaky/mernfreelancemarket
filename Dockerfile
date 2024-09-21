FROM node:18-alpine
#WORKDIR /app
COPY . .
#COPY supervisord.conf /etc/supervisord.conf

RUN apk add --no-cache tzdata  sqlite-dev postgresql-dev mysql-dev protobuf protobuf-dev npm sudo
RUN rm -rf package-lock.json && mkdir /var/log/supervisor/
RUN npm cache clean --force
RUN  npm install pm2 npm-run-all vite@4.0.0  -g
RUN ln -s /usr/local/lib/node_modules/ ../node_modules 
RUN chmod 777 . 
RUN  yarn set version 3.2.0
ENV NODE_ENV=production
ENV ENABLE_OVERCOMMIT_MEMORY=true
ENV MONGO_URI=mongodb+srv://abdoarh36:TyWF4ABOefQhJFbP@cluster0.bc7sxu7.mongodb.net/mernfreelancemarket
RUN cd client/
RUN yarn add -D vite-plugin-node-polyfills && yarn run build 
RUN mkdir ../server/server/public && \
cp -r ./dist/ ../server/public/ && \
cd ../api/ && npm install 
EXPOSE 8800 
CMD ["pm2-runtume start api/server.js -i 2"]
#CMD ["/usr/bin/supervisord","-c","./supervisord.conf"]
