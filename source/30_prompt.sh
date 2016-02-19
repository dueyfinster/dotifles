#!/bin/bash
if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      BASE03=$(tput setaf 234)
      BASE02=$(tput setaf 235)
      BASE01=$(tput setaf 240)
      BASE00=$(tput setaf 241)
      BASE0=$(tput setaf 244)
      BASE1=$(tput setaf 245)
      BASE2=$(tput setaf 254)
      BASE3=$(tput setaf 230)
      YELLOW=$(tput setaf 136)
      ORANGE=$(tput setaf 166)
      RED=$(tput setaf 160)
      MAGENTA=$(tput setaf 125)
      VIOLET=$(tput setaf 61)
      BLUE=$(tput setaf 33)
      CYAN=$(tput setaf 37)
      GREEN=$(tput setaf 64)
    else
      BASE03=$(tput setaf 8)
      BASE02=$(tput setaf 0)
      BASE01=$(tput setaf 10)
      BASE00=$(tput setaf 11)
      BASE0=$(tput setaf 12)
      BASE1=$(tput setaf 14)
      BASE2=$(tput setaf 7)
      BASE3=$(tput setaf 15)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 9)
      RED=$(tput setaf 1)
      MAGENTA=$(tput setaf 5)
      VIOLET=$(tput setaf 13)
      BLUE=$(tput setaf 4)
      CYAN=$(tput setaf 6)
      GREEN=$(tput setaf 2)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    # Linux console colors. I don't have the energy
    # to figure out the Solarized values
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

function ret_code(){
  local exit_code="$?"
  if [[ "$exit_code" -eq 0 ]]; then
    printf ""
    #printf "$GREEN✔$RESET "
  else
    echo "$RED✖ $exit_code$RESET "
  fi
}

export TERM='screen-256color'
#RET_CODE="\[$MAGENTA\]\$?\[$RESET\]"
USER="\[$ORANGE\]\u\[$RESET\]"
AT="\[$WHITE\]@\[$RESET\]"
HOST="\[$YELLOW\]\h\[$RESET\]"
COLON="\[$WHITE\]: \[$RESET\]"
DIR="\[$GREEN\]\w\[$RESET\]"
GIT="\[$WHITE\]\$(__git_ps1)\n\[$RESET\]"
TIME="\[$WHITE\]\A\[$RESET\] "
END="\[$WHITE\]\\$ \[$RESET\]"



export PS1="\$(ret_code)$USER$AT$HOST$COLON$DIR$GIT$TIME$END"
