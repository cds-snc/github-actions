#!/bin/bash
data=()

echo ""
echo "Searching for Dockerfiles ..."
echo "-----------------------------"

for f in $(find $GITHUB_WORKSPACE -name "Dockerfile"); do
    echo "Processing $f"
    while IFS= read -r line; do
      data+=( "$line" )
    done < <( sh -c "hadolint $* $f" )
done

if [ ${#data[@]} -eq 0 ]; then
    echo ""
    echo "\U1F984\n No vulnerabilities found!"
    exit 0
else
    echo ""
    echo "Found the following issues:"
    echo "---------------------------"
    printf '%s\n' "${data[@]}"
    exit 1
fi
