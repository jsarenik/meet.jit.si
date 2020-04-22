#!/bin/sh

{
cat <<EOF
index.html
config.js
base.html
body.html
css/all.css
libs/lib-jitsi-meet.min.js
libs/lib-jitsi-meet.min.map
libs/app.bundle.min.js
libs/app.bundle.min.map
libs/external_connect.js
libs/do_external_connect.min.js
libs/do_external_connect.min.map
head.html
favicon.ico
interface_config.js
logging_config.js
plugin.head.html
title.html
EOF
} | while read file
do
  DIR=/$file
  DIR=public/${DIR%/*}
  test -d $DIR || mkdir -p $DIR
  wget -qc -O public/$file https://meet.jit.si/$file && echo $file || echo ERROR $file
done
