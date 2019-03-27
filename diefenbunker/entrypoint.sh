#!/bin/sh
set -e

if [ -z "${AWS_KEY}" ]; then
    echo "MISSING AWS_KEY"
    exit 1
fi

if [ -z "${AWS_SECRET}" ]; then
    echo "MISSING AWS_SECRET"
    exit 1
fi

if [ -z "${S3_DESTINATION}" ]; then
    echo "MISSING S3_DESTINATION"
    exit 1
fi

echo "" >> ~/.s3cfg
echo "access_key = ${AWS_KEY}" >> ~/.s3cfg
echo "secret_key = ${AWS_SECRET}" >> ~/.s3cfg

NAME=`echo ${GITHUB_REPOSITORY} | sed 's/\//-/'`

PACKAGE_NAME="$NAME-${GITHUB_SHA}.zip"
PACKAGE_PATH="/tmp/$NAME-${GITHUB_SHA}.zip"

echo "Creating $PACKAGE_NAME ..."

cd $GITHUB_WORKSPACE 
zip -r $PACKAGE_PATH .
s3cmd put ${PACKAGE_PATH} ${S3_DESTINATION}${NAME}/${PACKAGE_NAME}
exit 0
