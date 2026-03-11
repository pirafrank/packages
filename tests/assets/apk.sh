#!/bin/sh

PROJECT_NAME="$1"

echo "Listing available packages for $PROJECT_NAME:"
apk search "$PROJECT_NAME"

echo "Checking $PROJECT_NAME package info:"
apk info "$PROJECT_NAME"

echo "Installing $PROJECT_NAME:"
apk add "$PROJECT_NAME"

echo "Checking $PROJECT_NAME version:"
$PROJECT_NAME --version
