#!/bin/sh

case "$OSTYPE" in
	linux-gnu | darwin*)
    if which curl > /dev/null; then
      RES=$(curl -s wttr.in/$1?format=3)
      country_and_city=$(echo $RES | cut -d ':' -f1)
      city=$( echo $country_and_city | cut -d ',' -f1)
      w_stats=$(echo $RES | cut -d ':' -f2)
      echo $city ":" $w_stats
      # printf %s "$RES"
    else
      ""
    fi
  ;;
  *) 
    print ""
  ;;
esac
