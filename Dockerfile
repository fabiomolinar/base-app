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
USER node
COPY package*.json ./
# If running for production:
# RUN npm install --only=production
RUN meteor npm install
COPY . .

EXPOSE 3000

CMD [ "meteor" ]