FROM buildkite/puppeteer:latest

RUN mkdir /app
ADD . /app/
WORKDIR /app

ENV NODE_ENV=production
RUN npm install
ENV PATH="${PATH}:/node_modules/.bin"

CMD node /app/src/index
