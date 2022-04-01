FROM node:16.14.0
ADD . /app
VOLUME /app/environments
WORKDIR /app
RUN npm install --production --registry=https://registry.npm.taobao.org
EXPOSE 6000
CMD [ "node", "." ]
