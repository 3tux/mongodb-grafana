FROM node:10.15.0 AS go-dev

# Install requirements
RUN apt-get update && apt-get install -y \
    net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

HEALTHCHECK CMD netstat -ltn | grep -c 3333

WORKDIR /grafana-mongodb-proxy
COPY . .

CMD bash -c "npm install --loglevel verbose && npm run server"
