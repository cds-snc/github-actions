#!/bin/sh
set -e

sh -c "git config --global user.name 'Mr Pinchy' \
      && git config --global user.email 'mr.pinchy@cds-snc.ca' \
      && git add -A && git commit -m '$*' --allow-empty \
      && git push -u origin HEAD"
