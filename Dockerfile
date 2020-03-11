# setup and install stage
FROM node:lts-alpine AS setup-stage

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# build stage
FROM setup-stage as build-stage
ENV NODE_ENV=production
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
