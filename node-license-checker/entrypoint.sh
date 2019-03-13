#!/bin/bash
data=()

echo ""
echo "Searching for license issues ..."
echo ""

sh -c "cd $GITHUB_WORKSPACE && license-checker $*"

if [ $? -eq 0 ]
then
  echo ""
  echo "The license checker did not find any issues with the flags your provided."
  exit 0
else
  echo ""
  echo "The license checker found issues with the flags your provided. See above." >&2
  exit 1
fi
