FROM alpine

RUN apk add --update nodejs nodejs-npm
RUN mkdir -p /usr/app
WORKDIR /usr/app


COPY package*.json /usr/app/
COPY app/* /usr/app/


RUN npm ci
COPY . .

EXPOSE 8080
CMD ["npm", "start"]
CMD ["node", "server.js"]
