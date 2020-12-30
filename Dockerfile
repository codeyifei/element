FROM node:10

COPY . /app

WORKDIR /app

RUN yarn && yarn build

FROM nginx

COPY --from=0 /app/dist /app

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app
