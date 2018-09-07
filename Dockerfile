FROM node:8.11.4
LABEL maintainer="Fabio Thomaz Molinar"

# Values: silent, error, warn, notice, http, timing, info, verbose, silly
ENV NPM_CONFIG_LOGLEVEL info
# Values: development, staging, production, testing
ENV NODE_ENV production

USER node
# Installing meteor.js (with --full flag)
RUN cd ~ && \
    curl "https://install.meteor.com/?release=1.7.0.5" | sh && \
    PATH=$PATH:$HOME/.meteor && \
    mkdir app && cd app && \
    meteor create --full .
ENV PATH "$PATH:/home/node/.meteor"

WORKDIR /home/node/app
EXPOSE 3000
CMD meteor