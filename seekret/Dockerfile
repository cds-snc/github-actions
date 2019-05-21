FROM cdssnc/seekret:5b62fc5

LABEL "name"="Seekret"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Seekret"
LABEL "com.github.actions.description"="Uses seekret to scan for secrets in your code"
LABEL "com.github.actions.icon"="lock"
LABEL "com.github.actions.color"="orange"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
