#!/bin/bash

PROJECT_NAME="$1"

echo "Listing available packages for $PROJECT_NAME:"
dnf list --showduplicates $PROJECT_NAME

echo "Installing $PROJECT_NAME:"
dnf install -y $PROJECT_NAME

echo "Checking $PROJECT_NAME version:"
$PROJECT_NAME --version
