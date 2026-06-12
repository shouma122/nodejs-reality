FROM node:alpine

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

RUN apk update && apk upgrade && \
    apk add --no-cache openssl curl gcompat iproute2 coreutils bash gawk && \
    chmod +x index.js start.sh

EXPOSE 3000

CMD ["node", "index.js"]
