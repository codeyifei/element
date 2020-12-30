FROM node:10

COPY . /app

WORKDIR /app

RUN yarn --registry https://registry.npm.taobao.org/ && yarn build

FROM nginx

COPY --from=0 /app/dist /app

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app
