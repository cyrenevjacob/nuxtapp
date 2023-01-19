#base node image
FROM node:10

WORKDIR /usr/src/app

ENV PORT 8080
ENV HOST 0.0.0.0

COPY package*.json ./

RUN npm install

# Copy local nuxt code to the container
COPY . .

# Build
RUN npm run build

# start the service
CMD npm start