FROM selenium/standalone-chrome:3.141

LABEL "name"="axe-core-analyser"
LABEL "maintainer"="Bethany Dunfield <bethany.dunfield@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="a11y-checker checker"
LABEL "com.github.actions.description"="Runs a scan of your deployment through axe-puppeteer"
LABEL "com.github.actions.icon"="user"
LABEL "com.github.actions.color"="orange"

USER root

RUN apt-get update
RUN apt-get install nodejs -y --no-install-recommends
RUN apt-get install npm -y --no-install-recommends
RUN rm -r /var/lib/apt/lists/*

RUN mkdir /app
COPY . /app/
WORKDIR /app

ENV NODE_ENV=production
RUN npm install
ENV PATH="${PATH}:/node_modules/.bin"

USER seluser

CMD ["node", "/app/src/index"]