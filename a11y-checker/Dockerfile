FROM selenium/standalone-chrome

LABEL "name"="axe-core-analyser"
LABEL "maintainer"="Bethany Dunfield <bethany.dunfield@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Axe-Core checker"
LABEL "com.github.actions.description"="Runs a scan of your deployment through axe-core"
LABEL "com.github.actions.icon"="user"
LABEL "com.github.actions.color"="orange"

USER root

RUN apt-get update
RUN apt-get install nodejs -y
RUN apt-get install npm -y

RUN mkdir /app
COPY . /app/
WORKDIR /app

ENV NODE_ENV=production
RUN npm install
ENV PATH="${PATH}:/node_modules/.bin"

CMD ["node", "/app/src/index"]