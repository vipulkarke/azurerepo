# 1. Use node:19.7.0-alpine base image
FROM node:19.7.0-alpine

# 2. Set the environment variable
ENV NODE_ENV=production

# 3a. Create a new directory in the root called "labone"
RUN mkdir /labone

# 3b. Change the ownership to the node user and group, and set it as the working directory
RUN chown -R node:node /labone
WORKDIR /labone

# 4. Set the user to node
USER node

# 5. Copy all source files and change ownership to the node user and group
COPY --chown=node:node . .

# 6. Install node.js packages
RUN npm install

# 7. Expose port 3000
EXPOSE 3000

# 8. Set default command to run the application
CMD ["node", "src/index.js"]
