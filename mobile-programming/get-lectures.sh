#!/bin/bash -e

cd "$(dirname "$BASH_SOURCE")"

cookie=$(cat cookie)
course_link='https://stem.elearning.unipd.it/course/view.php?id=5309'
file_link_regex='https://stem.elearning.unipd.it/mod/resource/view.php?id=[0-9]*'
links=$(curl -s $course_link --cookie "$cookie" | grep -o $file_link_regex)

for link in $links; do
    redirect=$(curl -s --cookie "$cookie" $link | grep -o 'https.*\.pdf')
    if [[ ! $redirect =~ .*x4\.pdf ]]; then
        file=$(echo ${redirect/https:*\/content\/[0-9]*\/})
        echo Downloading $file
        curl -s --cookie "$cookie" $redirect -o $file
    fi
done
