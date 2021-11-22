FROM node:13-alpine

ENV POSTGRES_DB = facedetection \
    POSTGRES_PASSWORD = test \
    POSTGRES_USER = postgres

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 5000
CMD [ "node", "server.js" ]
