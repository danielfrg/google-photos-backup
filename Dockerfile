FROM mcr.microsoft.com/playwright:v1.43.0-jammy

RUN mkdir -p /app
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install
RUN npx playwright install --with-deps chrome

COPY . .

VOLUME /data

CMD [ "node", "index.js" ]
