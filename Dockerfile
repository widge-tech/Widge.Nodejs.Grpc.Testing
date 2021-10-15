FROM node:14.18.1
ADD . /app
VOLUME /app/environments
WORKDIR /app
RUN npm install --production --registry=https://registry.npm.taobao.org
EXPOSE 6000
CMD [ "node", "." ]
