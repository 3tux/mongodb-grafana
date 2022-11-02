FROM node:10.15.0 AS go-dev
WORKDIR /grafana-mongodb-proxy
COPY . .
#RUN npm install -g @angular/cli@7.3
CMD bash -c "npm install --loglevel verbose && npm run server"
