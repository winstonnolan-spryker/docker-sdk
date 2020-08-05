# syntax = docker/dockerfile:experimental

FROM node:alpine

RUN mkdir -p /data

WORKDIR /data

COPY public/Spa/package.json public/Spa/package-lock.json /data/
RUN npm install && npm update

COPY public/Spa/dev-server.js public/Spa/favicon.png public/Spa/tsconfig.json public/Spa/tslint.json public/Spa/web-server.js public/Spa/webpack.config.js public/Spa/webpack-settings.js /data/
COPY public/Spa/configs /data/configs/
COPY public/Spa/src /data/src/

EXPOSE 3000
CMD ["npm", "run", "dev"]
