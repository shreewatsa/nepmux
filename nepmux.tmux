#!/usr/bin/env bash
#===============================================================================
#   Author: Shreewatsa Timalsena
#    Email: shreewatsa@gmail.com
#  Created: 2022-07-20 18:00
#===============================================================================

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# $1: option, $2: default value
tmux_get() {
    local value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

# $1: option, $2: value
tmux_set() {
    tmux set-option -gq "$1" "$2"
}

# Icons
right_arrow_icon=''
left_arrow_icon=''
upload_speed_icon=''
download_speed_icon=''
session_icon=''
user_icon=''
time_icon=''
date_icon=''
# Options
time_format=$(tmux_get @nepmux_time_format '%I:%M')
date_format=$(tmux_get @nepmux_date_format '%d %b %Y')
city=$(tmux_get @nepmux_city '')

# short for Theme-Colour
TC=$(tmux_get '@nepmux_theme' 'sun')
case $TC in
    'sun' )
        TC='#ffb86c'
        ;;
    'moon' )
        TC='#00abab'
        ;;
    'default' ) # Useful when your term changes colour dynamically (e.g. pywal)
        TC='colour3'
        ;;
esac

G01=#080808 #232
G02=#121212 #233
G03=#1c1c1c #234
G04=#262626 #235
G05=#303030 #236
G06=#3a3a3a #237
G07=#444444 #238
G08=#4e4e4e #239
G09=#585858 #240
G10=#626262 #241
G11=#6c6c6c #242
G12=#767676 #243

FG="$G10"
BG="$G04"

# Status options
tmux_set status-interval 60
tmux_set status on

# Basic status bar colors
tmux_set status-fg "$FG"
tmux_set status-bg "$BG"
tmux_set status-attr none

# Window status
tmux_set window-status-format " #I:#W#F "
tmux_set window-status-current-format "#[fg=$BG,bg=$G06]$right_arrow_icon#[fg=$TC,bold] #I:#W#F #[fg=$G06,bg=$BG,nobold]$right_arrow_icon"

# Window separator
tmux_set window-status-separator ""

# Window status alignment
tmux_set status-justify centre

# Current window status
tmux_set window-status-current-statys "fg=$TC,bg=$BG"

# Pane border
tmux_set pane-border-style "fg=$G07,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$TC,bg=$BG"

# Pane number indicator
tmux_set display-panes-colour "$G07"
tmux_set display-panes-active-colour "$TC"

# Clock mode
tmux_set clock-mode-colour "$TC"
tmux_set clock-mode-style 24

# Message
tmux_set message-style "fg=$TC,bg=$BG"

# Command message
tmux_set message-command-style "fg=$TC,bg=$BG"

# Copy mode highlight
tmux_set mode-style "bg=$TC,fg=$FG"

#     
# Left side of status bar
tmux_set status-left-bg "$G04"
tmux_set status-left-fg "G12"
tmux_set status-left-length 150
user=$(whoami)
LS="#[fg=$G04,bg=$TC,bold] $user_icon $user@#h #[fg=$TC,bg=$G06,nobold]$right_arrow_icon#[fg=$TC,bg=$G06] $session_icon #S "
LS="$LS#[fg=$G06,bg=$BG]$right_arrow_icon"
tmux_set status-left "$LS"

# Right side of status bar
tmux_set status-right-bg "$G04"
tmux_set status-right-fg "G12"
tmux_set status-right-length 150

RS=""

#Nepse and weather data formatting.
nepse_nocolor=$($CURRENT_DIR/scripts/nepse.sh)
weather_nocolor=$($CURRENT_DIR/scripts/weather.sh $city)

if [ ! -z "$nepse_nocolor" ]; then
  nepse_color=$(echo $nepse_nocolor | \
    awk -v icon="$left_arrow_icon" '{\
      if ($2>0) {print "#[fg=green]" icon "#[fg=black,bold,bg=green,dim]"}\
      else {print "#[fg=red]" icon "#[fg=white,bg=red,bold]"}\
          printf(" NEPSE "); printf("%4.0f ", $1) ; printf("%.1f", $2); printf "%"}')
  RS="$RS""$nepse_color";
fi

if [ ! -z "$weather_nocolor" ]; then
  RS="$RS"" #[fg=deepskyblue3]$left_arrow_icon#[fg=white,bg=deepskyblue3] $weather_nocolor"
fi

RS="$RS"" #[fg=$G06]$left_arrow_icon#[fg=$TC,bg=$G06] $time_icon $time_format #[fg=$TC,bg=$G06]$left_arrow_icon#[fg=$G04,bg=$TC] $date_icon $date_format "
tmux_set status-right "$RS"

