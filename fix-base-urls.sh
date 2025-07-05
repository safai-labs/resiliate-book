#!/bin/bash

# Script to add base href tag to all HTML files in the book directory
# Run this after mdbook build

echo "Adding base href tags to all HTML files..."
find book -name "*.html" -exec sed -i '/<head>/a \        <base href="https://docs.saf.ai/">' {} \;
echo "Done!"
