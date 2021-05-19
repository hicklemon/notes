#!/usr/bin/env bash

mkdir -vp slackmojis && pushd slackmojis
for INDEX_URL in $(curl -sqkLX GET https://slackmojis.com/ | ( egrep "href.*categories"; echo '="/emojis/recent">'; echo '="/emojis/popular">' ) | perl -pe 's|.*="(.*)">.*|https://slackmojis.com\1|')
do
    for IMAGE_URL in $(curl -sqkLX GET ${INDEX_URL} | egrep "lazy.*(png|jpg|jpeg|gif|gifv)" | perl -pe 's|.*src="(.*)\?.*".*|\1|')
    do
        echo ${IMAGE_URL}
    done
done | xargs -n1 -P1 -d '\n' echo RAND=$\(\(1 + \$RANDOM % 2\)\)\; echo "Sleeping for \$RAND seconds"\; sleep \$RAND\; wget | bash -l - && popd
