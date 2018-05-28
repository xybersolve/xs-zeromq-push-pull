FROM xybersolve/xs-zeromq-node-base:latest

MAINTAINER Greg Milligan <xybersolve@gmail.com>

COPY ./ /app
WORKDIR /app

RUN rm -rf node_modules && \
    apt-get update && \
    npm install

EXPOSE 5688
# if this doesn't blow up, at least it is structurally viable
CMD ["node", "/app/index.js"]
