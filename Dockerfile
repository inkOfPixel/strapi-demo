FROM strapi/base:alpine

ARG STRAPI_VERSION
RUN yarn global add @strapi/strapi@${STRAPI_VERSION}

WORKDIR /srv/app

COPY ./package*.json /srv/app/
RUN npm install

COPY ./src/ /srv/app/src/
COPY ./config/ /srv/app/config/
COPY ./database/ /srv/app/database/
COPY ./public/ /srv/app/public/

RUN npm run build

CMD ["npm", "start"]