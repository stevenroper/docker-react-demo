# Dockerfile for prod builds

# BUILD PHASE
FROM node:12-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN PHASE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html