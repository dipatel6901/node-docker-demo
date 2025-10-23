# node-docker-demo

Step 1: Create your project
mkdir node-docker-demo
cd node-docker-demo
Step 2: Initialize and add Express
npm init -y
npm install express
Step 3: Create app.js
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from Node.js inside Docker!');
});

app.listen(3000, () => {
  console.log('App running on port 3000');
});

Step 4: Write your Dockerfile
#use Node.js base image on Alpine for smaller image size
FROM node:20-alpine

#define working directory
WORKDIR /app

#copy project files
COPY package*.json ./

#install dependencies (ci for faster and ensures a clean install)
RUN npm ci --only=production

COPY . .

#assign port
EXPOSE 3000

#run the docker image
CMD ["node", "app.js"]

Step 5: Build and run
docker build -t node-demo .
docker run -d -p 3000:3000 node-demo
Go to http://localhost:3000
You’ll see:
Hello from Node.js inside Docker!
