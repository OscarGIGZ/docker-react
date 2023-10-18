FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
# The nginx will start automatically, no command is needed, only if you want to use a specific one
