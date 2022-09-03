FROM node:alpine3.15 as BUILD

ENV NPM_CONFIG_LOGLEVEL info

WORKDIR /home

COPY . .

RUN  apk add --no-cache python3 make g++

RUN yarn && \
    yarn build

RUN vips dzsave dist/sword_coast.*.webp xxx --layout google --suffix .webp[Q=75]
compress_images.sh

FROM nginx

COPY --from=BUILD /home/dist /usr/share/nginx/html