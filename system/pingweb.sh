#!/bin/bash
cd $(dirname $0)
jsonfile="services.json"
totalservices=$(jq length $jsonfile)
i=0;
while [ "$i" -lt $totalservices ]; do
  url=$(jq -r '.['$i'].url' $jsonfile)
  service=$(jq -r '.['$i'].name' $jsonfile)
  isUP=$(curl -AKURL -sIL $url | grep HTTP | grep 200 | awk '{print $2}')
  if [ $isUP = "200" ]; then
    echo "pingweb{app=\""$service"\"} 1"
  elif [ $isUP = "PONG" ]; then
    echo "pingweb{app=\""$service"\"} 1"
  else
    echo "pingweb{app=\""$service"\"} 0"
  fi
  sleep 3
  i=$(( i + 1 ))
done > /usr/share/nginx/html/metrics
