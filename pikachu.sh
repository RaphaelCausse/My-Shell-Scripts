#!/bin/bash

# Install this script using my rfew.sh script.

# Add this line at the end of your shell rc file (~/.bashrc or ~/.zshrc or ~/.kshrc ...) :
# using this command : MYSHELL=$(echo $(basename $SHELL)) && echo -e "\n# Banner\npikachu" >> ~/.${MYSHELL}rc 

# OR if you want random banners, add those lines at the end of your shell rc file :
#   # Random banner
#   randint=$(shuf -i 1-2 -n1)
#   case ${randint} in
#       1) pikachu ;;
#       2) cow ;;
#       *) clear ;;
#   esac


# Text color variables
RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

if (($# == 0)); then
    # Display banner
    clear
    echo -e "    ${YLW}..__         HI THERE !       __., "
    echo "     \##\~~--.,.---~~~~~~-.,.--~~/##/ "
    echo "      °~-.   °             °    _,~°        ____., "
    echo "         \~.                .-~/   _,/---~~/°   / "
    echo -e "           / ${NC},^.      ,^.${YLW}      |  (~~        __/ "
    echo -e "          |  ${NC}!_!      !_!${YLW}       \  \     ,--° "
    echo -e "         /${RED}-.      °       ,-.${YLW}    )  \_   \. "
    echo -e "         (${RED}-°   ${YLW}#..~..#    ${RED}°-°${YLW}    |    \._  \. "
    echo "          °.                    /,     _)  / "
    echo -e "           /°~_              .,°°\   ./# ,/ "
    echo -e "          /               .   ${NC}-~~~${YLW}\  (###( "
    echo -e "          |              /   |  .,°\  \##| "
    echo -e "          |   /         /   /   ${NC}-~~${YLW}| _/##/ "
    echo -e "          !   |     .  |   /    .,°|/##/ "
    echo -e "          );__(        );_(    ${NC}-~~~${YLW}|##/ "
    echo "            \                     °/#/ "
    echo "            |             /       /_-° "
    echo "            \     ,°_____/.     ./ "
    echo -e "            (    /        \     / "
    echo -e "            °_;_/          |_;_°     ${NC}R.C "
fi