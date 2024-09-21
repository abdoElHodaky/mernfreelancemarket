FROM node:18-alpine
#WORKDIR /app
COPY . .
#COPY supervisord.conf /etc/supervisord.conf

RUN apk add --no-cache tzdata  sqlite-dev postgresql-dev mysql-dev protobuf protobuf-dev redis supervisor sudo
RUN rm -rf package-lock.json && mkdir /var/log/supervisor/
RUN npm cache clean --force
RUN  npm install pm2 npm-run-all -g
RUN chmod 777 .
RUN  yarn install -y 
ENV NODE_ENV=production
ENV ENABLE_OVERCOMMIT_MEMORY=true
#ENV MONGO_URI=mongodb+srv://abdoarh36:TyWF4ABOefQhJFbP@cluster0.bc7sxu7.mongodb.net/mernfreelancemarket
RUN cd client && npm install --force && \
npm run build && mkdir ../server/server/public && \
cp -r ./dist/ ../server/public/ && \
cd ../api/ && npm install 
EXPOSE 8800 
CMD ["node api/server.js"]
#CMD ["/usr/bin/supervisord","-c","./supervisord.conf"]
