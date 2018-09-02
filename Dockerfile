FROM node:8.11.4
LABEL maintainer="Fabio Thomaz Molinar"

# Values: silent, error, warn, notice, http, timing, info, verbose, silly
ENV NPM_CONFIG_LOGLEVEL info
# Values: development, staging, production, testing
ENV NODE_ENV production

WORKDIR /usr/src/app

COPY package*.json ./
# If running for production:
# RUN npm install --only=production
RUN npm install

COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]

USER node