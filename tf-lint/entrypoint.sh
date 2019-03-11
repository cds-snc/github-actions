#!/bin/bash
data=()

echo ""
echo "Searching for Terraform files ..."
echo "-----------------------------"

for f in $(find $GITHUB_WORKSPACE -name "*.tf"); do
    echo "Processing $f"
    while IFS= read -r line; do
      if [ "${line}" != "Awesome! Your code is following the best practices :)" ]; then
        data+=( "$line" )
      fi
    done < <( sh -c "tflint $* $f" )
done
if [ ${#data[@]} -eq 0 ]; then
    echo ""
    echo "No issues found!"
    exit 0
else
    echo ""
    echo "Found the following issues:"
    echo "---------------------------"
    printf '%s\n' "${data[@]}"
    echo ""
    exit 1
fi
