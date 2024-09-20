FROM node:18-alpine
#WORKDIR /app
COPY . .
#COPY supervisord.conf /etc/supervisord.conf

RUN apk add --no-cache tzdata  sqlite-dev postgresql-dev mysql-dev protobuf protobuf-dev redis supervisor sudo
RUN rm -rf package-lock.json && mkdir /var/log/supervisor/
RUN npm cache clean --force
RUN  yarn add chalk redis-url mariadb  && npm install pm2 npm-run-all -g
RUN chmod +x *.sh && sh clientrun.sh
RUN  yarn install -y 
ENV NODE_ENV=production
ENV ENABLE_OVERCOMMIT_MEMORY=true
#ENV MONGO_URI=mongodb+srv://abdoarh36:TyWF4ABOefQhJFbP@cluster0.bc7sxu7.mongodb.net/mernfreelancemarket
EXPOSE 8800 
CMD ["sh","./apirun.sh"]
#CMD ["/usr/bin/supervisord","-c","./supervisord.conf"]
