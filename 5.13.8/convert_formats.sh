#!/bin/bash
VERSION='5.13.8'
pandoc -f html -t markdown -o LKMPG-${VERSION}.md LKMPG-${VERSION}.html
pandoc -f markdown -t rst -o LKMPG-${VERSION}.rst LKMPG-${VERSION}.md
git add LKMPG-${VERSION}.md
git add LKMPG-${VERSION}.rst
