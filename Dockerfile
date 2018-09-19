ARG NODE_VERSION=8.11.4
ARG METEOR_VERSION=1.7.0.5
ARG METEOR_FLAG=--full

FROM node:${NODE_VERSION}
LABEL maintainer="Fabio Thomaz Molinar"

# Values: silent, error, warn, notice, http, timing, info, verbose, silly
ENV NPM_CONFIG_LOGLEVEL info
# Values: development, staging, production, testing
ENV NODE_ENV production

USER node
RUN cd ~ && \
    curl "https://install.meteor.com/?release="${METEOR_VERSION} | sh && \
    PATH=$PATH:$HOME/.meteor && \
    mkdir -p app && cd app && \
    meteor create ${METEOR_FLAG} .
ENV PATH "$PATH:/home/node/.meteor"

WORKDIR /home/node/app
EXPOSE 3000
CMD meteor