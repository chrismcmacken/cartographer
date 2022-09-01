FROM node:alpine3.15 as BUILD

ENV NPM_CONFIG_LOGLEVEL info

COPY . .

RUN  apk add --no-cache python3 make g++ && \
    yarn

RUN yarn build --log-level verbose src/index.html
    

FROM nginx

COPY --from=BUILD dist /usr/share/nginx/html