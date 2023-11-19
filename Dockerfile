# FROM scratch
# FROM docker.io/alpine
FROM docker.io/nginx:alpine-slim

ARG arch=amd64

WORKDIR /usr/share/nginx/html/

COPY build/web/ .
