# providing the full base image tag for the Node.js version that corresponds to the SHA256 hash
# FROM node:lts-alpine@sha256:7001ff8aabeabe8844ef8e7613afaf723e832e19fba55bf1b9929739c7723ece
FROM public.ecr.aws/docker/library/node:lts-stretch-slim

ENV NODE_ENV production

# Create app directory
WORKDIR /usr/src/boilerplate-app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# If you are building your code for development
# RUN npm install

# If you are building your code for production
RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8081
CMD [ "node", "server/server.js" ]