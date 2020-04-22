#!/bin/sh

{
cat <<EOF
index.html
config.js
base.html
body.html
head.html
favicon.ico
interface_config.js
logging_config.js
plugin.head.html
title.html
css/all.css
libs/lib-jitsi-meet.min.js
libs/lib-jitsi-meet.min.map
libs/app.bundle.min.js
libs/app.bundle.min.map
libs/external_connect.js
libs/do_external_connect.min.js
libs/do_external_connect.min.map
images/add_to_slack.png
images/welcome_page/appstore.svg
images/welcome_page/facebook.svg
images/welcome_page/github.svg
images/welcome_page/googleplay.png
images/welcome_page/linkedin.svg
images/welcome_page/twitter.svg
static/welcomePageAdditionalContent.html
EOF
} | while read file
do
  DIR=/$file
  DIR=public/${DIR%/*}
  test -d $DIR || mkdir -p $DIR
  wget -qc -O public/$file https://meet.jit.si/$file && echo $file || echo ERROR $file
done
