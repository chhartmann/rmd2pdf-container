#!/bin/bash
cd ~
FILE="./cv/cv.rmd"
CMD='Rscript render_cv.r'
while true; do
  NEW_MD5=$(md5sum "$FILE" 2>/dev/null | cut -d' ' -f1 || :)
  [[ "$NEW_MD5" != "${OLD_MD5:-}" ]] && echo "Change!" && eval "$CMD" && OLD_MD5="$NEW_MD5"
  sleep 2
done
