#!/bin/bash
VERSION='5.13.8'
cp img/cover.png ..
pandoc -f html -t markdown -o LKMPG-${VERSION}.md LKMPG-${VERSION}.html
pandoc -f markdown -t rst -o LKMPG-${VERSION}.rst LKMPG-${VERSION}.md
git add LKMPG-${VERSION}.md
git add LKMPG-${VERSION}.rst
ebook-convert LKMPG-${VERSION}.html LKMPG-${VERSION}.epub --cover img/cover.png --authors "Peter Jay Salzman, Michael Burian, Ori Pomerantz, Bob Mottram, Jim Huang" --language "English" --tags "kernel, programming, C, linux" --comments "Learn how to write modules for the Linux kernel" --title "The Linux Kernel Module Programmers Guide"
cp LKMPG-${VERSION}.epub ../lkmpg.epub
