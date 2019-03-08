FROM buildkite/puppeteer:v1.11.0

LABEL "name"="google-analytics-anonymize-ip"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Anonymized IP checker"
LABEL "com.github.actions.description"="Checks if you use IP anonymization in Google analytics"
LABEL "com.github.actions.icon"="user"
LABEL "com.github.actions.color"="orange"

RUN mkdir /app
COPY . /app/
WORKDIR /app

ENV NODE_ENV=production
RUN npm install
ENV PATH="${PATH}:/node_modules/.bin"

CMD ["node", "/app/src/index"]
