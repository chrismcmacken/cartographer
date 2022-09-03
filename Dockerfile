FROM node:alpine3.15 as BUILD

ENV NPM_CONFIG_LOGLEVEL info

WORKDIR /home

COPY . .

RUN  apk add --no-cache python3 make g++

RUN yarn && \
    yarn build

FROM nginx

COPY --from=BUILD /home/dist /usr/share/nginx/html