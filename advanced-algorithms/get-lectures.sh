#!/bin/bash -e

cd "$(dirname "$BASH_SOURCE")"

cookie=$(cat cookie)
links=$(curl -s 'https://stem.elearning.unipd.it/course/view.php?id=4978' --cookie "$cookie" | sed 's/>/&\n/g' | grep -o '<a .*href="https://stem.elearning.unipd.it/mod/resource/view.php?id=[0-9]*">' | sed 's/.*href="\(.*\)".*/\1/')

i=1
for link in $links; do
    echo Downloading lecture $i
    curl -s --cookie "$cookie" $link -o lecture-$(printf "%02d\n" $i).pdf
    i=$(( i + 1 ))
done
