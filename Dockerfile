FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# port
EXPOSE 8099

COPY --from=builder /app/build /usr/share/nginx/html
# http://hub.docker.com/_/nginx/
# default container image for nginx auto starts so no need to do CMD run

# https://registry-1.docker.io/v2/library/nginx/manifests/latest
# {"errors":[{"code":"UNAUTHORIZED","message":"authentication required","detail":[{"Type":"repository","Class":"","Name":"library/nginx","Action":"pull"}]}]}
## just signin to account via docker desktop to authenticate 


