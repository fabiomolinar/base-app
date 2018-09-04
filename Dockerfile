FROM node:8.11.4
LABEL maintainer="Fabio Thomaz Molinar"

# Values: silent, error, warn, notice, http, timing, info, verbose, silly
ENV NPM_CONFIG_LOGLEVEL info
# Values: development, staging, production, testing
ENV NODE_ENV production

# Installing Meteor
RUN cd ~ && \
    curl "https://install.meteor.com/?release=1.7.0.5" | sh

# Project setup
WORKDIR /home/node/app
COPY package*.json ./
COPY . .
# 1. If running for production:
# 	 RUN npm install --only=production
# 2. Changing file permissions to node user
# 3. Deleting the local build folder
RUN meteor npm install && \
	chown -R node:node . && \
	rm -r .meteor/local

EXPOSE 3000

USER node
CMD [ "meteor" ]