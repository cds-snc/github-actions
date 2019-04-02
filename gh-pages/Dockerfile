FROM alpine/git:1.0.7

LABEL "name"="GH Pages"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="GitHub Pages Deploy"
LABEL "com.github.actions.description"="Deploy static assets to GitHub Pages."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
