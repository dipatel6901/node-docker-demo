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

