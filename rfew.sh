#!/bin/bash

function usage {
    echo -e "\e[1mUsage:\e[0m\n\trfew [-h|-l] [-a|-r script_name]\n"
    echo -e "\e[1mOptions:\e[0m"
	echo -e "\t\e[1m-h\e[0m\tPrint this help message and exit."
    echo -e "\t\e[1m-l\e[0m\tList all files in ~/.local/bin/ ."
    echo -e "\t\e[1m-a\e[0m\tAdd script to ~/.local/bin . Make it executable in every directory.\n"
    echo -e "\t\e[1m-r\e[0m\tRemove script from ~/.local/bin .\n"
    echo -e "\e[1mDescription:\e[0m"
    echo -e "\tRun From EveryWhere (rfew) is a tool to make your scripts executable everywhere. Make sure to give your script execution rights."
}

RED='\033[0;31m'
NC='\033[0m'

while getopts "hla:r:" options; do
    case ${options} in
        h)
            usage && exit 0 ;;
        l)
            ls -lh --color=auto ~/.local/bin/ ;;
        a)
            if [ -x ${OPTARG} ]; then
                name_script=$(basename ${OPTARG} | cut -d'.' -f1)
                cp ${OPTARG} ~/.local/bin/${name_script}
                echo -e "Added [${name_script}] to /.local/bin/"
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} unvalid file: is not executable"
		        echo "Run « ./rfew.sh -h » for more information" 
                exit 2
            fi ;;
        r)
            name_script=$(basename ${OPTARG} | cut -d'.' -f1)
            if [ -x ~/.local/bin/${name_script} ]; then
                rm -i ~/.local/bin/${name_script}
                echo "Removed [${name_script}] from ~/.local/bin/"
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} unvalid file: no such file '${name_script}'\n"
                echo "Files you can remove from ~/.local/bin/ :"
                ls --color=auto ~/.local/bin/
                exit 3
            fi ;;
        *)
            usage && exit 1 ;;
    esac
done
