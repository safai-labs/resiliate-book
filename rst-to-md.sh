#!/bin/bash
# Convert ReStructered Text files to MarkDown using pandoc
FILES=*.rst
for f in $FILES
do
  filename="${f%.*}"
  echo "Converting $f to $filename.md"
  `pandoc $f -f rst -t markdown -o $filename.md`
done
