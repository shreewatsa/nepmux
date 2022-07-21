#!/bin/sh

case "$OSTYPE" in
	linux-gnu | darwin*)
    if which curl > /dev/null; then
      RES=$(curl -s wttr.in/Kathmandu?format=3)
      printf %s "$RES"
    else
      ""
    fi
  ;;
  *) 
    print ""
  ;;
esac
