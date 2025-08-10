#!/bin/sh
. /lib/functions.sh
config_load newdevnotify
config_get enabled main enabled 1
[ "$enabled" = "1" ] || exit 0
config_get token   main token
config_get chat_id main chat_id
TEXT="$1"
[ -n "$token" ] && [ -n "$chat_id" ] || exit 0
curl -s "https://api.telegram.org/bot${token}/sendMessage" \
  --data-urlencode "chat_id=${chat_id}" \
  --data-urlencode "text=${TEXT}" \
  --data-urlencode "parse_mode=HTML" > /dev/null
