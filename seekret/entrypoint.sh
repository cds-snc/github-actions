#!/bin/bash
data=()

echo ""
echo "Searching for secrets ..."

while IFS= read -r line; do
  data+=( "$line" )
done < <( sh -c "seekret $* dir $GITHUB_WORKSPACE" )

if [ ${#data[@]} -eq 1 ]; then
    echo ""
    echo "No secrets found!"
    exit 0
else
    echo ""
    echo "Found the following secrets:"
    echo "---------------------------"
    printf '%s\n' "${data[@]}"
    echo ""
    exit 1
fi
