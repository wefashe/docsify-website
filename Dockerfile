FROM node:lts AS wenfsblog
#node:lts-alpine
WORKDIR docs

ENV PORT 9090
EXPOSE $PORT/tcp

ENV LANG C.UTF-8

ADD . .
ENTRYPOINT npm i docsify-cli -g && docsify serve . -p $PORT


