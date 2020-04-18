#!/bin/bash

#remove current list of plugins
< ./hop-user-manual/modules/ROOT/nav.adoc sed '/::=START/,/::=END/{/::=START/!{/::=END/!d}}' > ./hop-user-manual/modules/ROOT/nav_temp.adoc

#replace nav with empty
cp ./hop-user-manual/modules/ROOT/nav_temp.adoc ./hop-user-manual/modules/ROOT/nav.adoc

#move to plugins directory
cd ./hop-user-manual/modules/ROOT/pages/plugins/

#generate file list and folder depth
for f in $(find . -type f -name '*.adoc' ! -name 'plugins.adoc' -exec bash -c 'echo -n '{}':; echo '{}' | grep -o / | wc -l' \;)
do
    #generate needed parts for xref
    NESTING_LEVEL=$(($(awk -F  ":" '{print $2}' <<< $f)+1));
    FILE_LOCATION=$(awk -F  ":" '{print $1}' <<< $f | cut -c3-)
    FILE_NAME=$(grep -m 1 -nr "=" $(awk -F  ":" '{print $1}' <<< $f) | awk -F  "=" '{print $2}' | sed -e 's/^[[:space:]]*//');
    NESTING_STARS=$(printf '*%.0s' $(seq $NESTING_LEVEL))

    #creage xref
    NEW_LINE="$NESTING_STARS xref:$FILE_LOCATION[$FILE_NAME]"

    #add xref to file
    awk "/::=START/ { print; print \"$(echo "$NEW_LINE")\"; next }1" ../../nav.adoc > ../../nav_temp.adoc
    cp ../../nav_temp.adoc ../../nav.adoc
    echo """$NEW_LINE"""
done

#remove temp navigation file
rm ../../nav_temp.adoc

