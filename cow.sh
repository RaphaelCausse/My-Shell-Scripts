#!/bin/bash

# Install this script using my rfew.sh script.

# Add this line at the end of your shell rc file (~/.bashrc or ~/.zshrc or ~/.kshrc ...) :
# using this command : MYSHELL=$(echo $(basename $SHELL)) && echo -e "\n# Banner\ncow" >> ~/.${MYSHELL}rc

# OR if you want random banners, add those lines at the end of your shell rc file :
#   # Random banner
#   randint=$(shuf -i 1-2 -n1)
#   case ${randint} in
#       1) pikachu ;;
#       2) cow ;;
#       *) clear ;;
#   esac


if (($# == 0)); then
    # Display banner
    clear
    echo -e "               ---------------------------  "
    echo -e "              <   Hello my cow-worker !   > "
    echo -e "               ---------------------------  "
    echo -e "                ^__^           \    ^__^ "
    echo -e "        _______/(00)            \   (^0)\_______ "
    echo -e "    /\/(       /(__)                (__)\       )\/\ "
    echo -e "       | W----||       w                ||----W | "
    echo -e "       ||     ||      \`|*       #       ||     || "
    echo -e "^^^^^^^^^^*^^^^^^^^^^*^^^^^^^^^^^^^*^^^^^^^^^^^^^^^^^^^^  R.C "
fi