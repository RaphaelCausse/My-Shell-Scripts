#!/bin/bash

function usage {
    clear
    echo -e "${GRN}${BOLD}NAME${NT}${NC}"
    echo -e "\trfew - run a script from everywhere\n"
    echo -e "${GRN}${BOLD}SYNOPSIS${NT}${NC}"
    echo -e "\t./rfew.sh [${GRN}${BOLD}-h${NT}${NC}|${GRN}${BOLD}-l${NT}${NC}]"
    echo -e "\t./rfew.sh ${GRN}${BOLD}-a${NT}${NC}|${GRN}${BOLD}-r${NT}${NC} <${CYAN}script${NC}>\n"
    echo -e "${GRN}${BOLD}OPTIONS${NT}${NC}"
    echo -e "\t${GRN}${BOLD}-h${NT}${NC}\tdisplay this help message and exit\n"
    echo -e "\t${GRN}${BOLD}-l${NT}${NC}\tlist all script files in ~/.local/bin/\n"
    echo -e "\t${GRN}${BOLD}-a${NT}${NC} ${CYAN}script${NC}"
    echo -e "\t\tadd ${CYAN}script${NC} to ~/.local/bin/\n"
    echo -e "\t${GRN}${BOLD}-r${NT}${NC} ${CYAN}script${NC}"
    echo -e "\t\tremove ${CYAN}script${NC} from ~/.local/bin/\n\t\tif ${CYAN}script${NC} doesn't exist, it list all script files that can be removed"
    echo -e "${GRN}${BOLD}DESCRIPTION${NT}${NC}"
    echo -e "\tRfew is a tool to make a script executable from everywhere in a user session.\n\tIt installs a copy of a script without the file extension in ~/.local/bin/.\n\tThe user can call the script as a command everywhere.\n"
    echo -e "${GRN}${BOLD}AUTHOR${NT}${NC}"
    echo -e "\tWritten by Raphael CAUSSE.\n"
}

function list_files_local_bin {
    for i in $(find ~/.local/bin/ -executable -type f); do
        [ -x $i ] && echo -e "${GRN}${BOLD}$(basename ${i})${NT}${NC}"
    done
}

# Text modifier variables
BOLD='\e[1m'
NT='\e[0m'

# Text color variables
RED='\033[0;31m'
GRN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

while getopts "hla:r:" options; do
    case ${options} in
        h)
            usage && exit 0 ;;
        l)
            echo "Script files in ~/.local/bin/ :"
            list_files_local_bin
            exit 0 ;;
        a)
            if [ -x ${OPTARG} ]; then
                name_script=$(basename ${OPTARG} | cut -d'.' -f1)
                cp -u ${OPTARG} ~/.local/bin/${name_script}
                echo -e "Added '${name_script}' to ~/.local/bin/"
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} unvalid file: is not executable"
		        echo "Run « ./rfew.sh -h » for more information" 
                exit 2
            fi ;;
        r)
            name_script=$(basename ${OPTARG} | cut -d'.' -f1)
            if [ -x ~/.local/bin/${name_script} ]; then
                rm -i ~/.local/bin/${name_script}
                echo "Removed '${name_script}' from ~/.local/bin/"
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} unvalid file: no such file '${name_script}'\n"
                echo "Script files you can remove from ~/.local/bin/ :"
                list_files_local_bin
                exit 3
            fi ;;
        *)
            usage && exit 1 ;;
    esac
done