FROM hadolint/hadolint:latest-debian

LABEL "name"="docker-lint"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Docker lint"
LABEL "com.github.actions.description"="Lints docker files in your repository"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="orange"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
