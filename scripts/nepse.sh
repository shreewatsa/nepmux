#!/bin/sh

case "$OSTYPE" in
	linux-gnu | darwin*)
    if which curl > /dev/null; then
      RES=$(curl -s https://nepsealpha.com/trading-menu/top-stocks/NEPSE | \
        jq -r '[.price.today_price, .price.percent_change] | join(" ")' \
      )
      echo $RES
    else
      ""
    fi
  ;;
  *) 
    print ""
  ;;
esac


