#!/bin/bash

# This script performs content updates for translationCore

set -xe

echo "Downloading latest language names from translationDatabase..."
curl https://td.unfoldingword.org/exports/langnames.json > src/assets/langnames.json

echo "Update bundled resources..."
npm run update-resources
