#!/bin/bash

# This hook is called after the book is built
# It adds the base href tag to all HTML files

echo "Running post-build hook..."
find book -name "*.html" -exec sed -i '/<head>/a \        <base href="https://docs.saf.ai/">' {} \;
echo "Post-build hook completed successfully"
