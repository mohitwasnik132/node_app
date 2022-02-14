FROM alpine

RUN apk add --update nodejs npm
#this used to be nodejs-npm since we are on alpine and it's removed change it to npm


WORKDIR /app


COPY package.json /app



RUN npm install
COPY . /app

EXPOSE 8080
CMD ["npm", "start"]

#CMD ["node", "server.js"]
