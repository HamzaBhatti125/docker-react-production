# build phase for production
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# production phase
FROM nginx
#copy over the result of npm run build here
COPY --from=builder /app/build /usr/share/nginx/html 
