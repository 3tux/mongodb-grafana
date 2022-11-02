FROM node:10.15.0 AS go-dev

# Install requirements
RUN apt-get update && apt-get install -y \
    net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

HEALTHCHECK --start_period=1m --interval=1m --retries=3 CMD netstat -ltn | grep -c 3333

WORKDIR /grafana-mongodb-proxy
COPY . .

CMD bash -c "npm install --loglevel verbose && npm run server"
