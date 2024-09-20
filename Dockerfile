FROM node:18-alpine
#WORKDIR /app
COPY . .
#COPY supervisord.conf /etc/supervisord.conf

RUN apk add --no-cache tzdata  sqlite-dev postgresql-dev mysql-dev protobuf protobuf-dev redis supervisor sudo
RUN rm -rf package-lock.json && mkdir /var/log/supervisor/
RUN npm cache clean --force
#RUN  yarn add chalk redis-url mariadb  && npm install pm2 npm-run-all -g
#RUN yarn add ts-node-dev --dev
RUN  yarn install -y 
ENV NODE_ENV=production
ENV ENABLE_OVERCOMMIT_MEMORY=true
#ENV MONGO_URI 
EXPOSE 8800 5173 9001

CMD ["/usr/bin/supervisord","-c","./supervisord.conf"]
