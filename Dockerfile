FROM node:14.17.0 as base
WORKDIR /app
ADD package*.json ./
RUN npm install
ADD index.js ./


FROM alpine
WORKDIR /app
copy --from=base /app/index.js .
CMD [ "node", "index.js"]
