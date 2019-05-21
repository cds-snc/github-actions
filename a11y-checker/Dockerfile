FROM buildkite/puppeteer:v1.11.0

LABEL "name"="a11y-scanner"
LABEL "maintainer"="Bethany Dunfield <bethany.dunfield@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="A11y scanner"
LABEL "com.github.actions.description"="Runs a scan of your deployment through axe-puppeteer"
LABEL "com.github.actions.icon"="user"
LABEL "com.github.actions.color"="orange"

RUN mkdir /app
COPY . /app/
WORKDIR /app

ENV NODE_ENV=production
RUN npm install
ENV PATH="${PATH}:/node_modules/.bin"

CMD ["node", "/app/src/index"]