#!/bin/bash

function usage {
    echo -e "\e[1mUsage:\e[0m\n\trfew [-h|-l] [ -a|-r path/to/script ]\n"
    echo -e "\e[1mOptions:\e[0m"
	echo -e "\t\e[1m-h\e[0m\tPrint this help message and exit."
    echo -e "\t\e[1m-l\e[0m\tList all files in /usr/local/bin/ ."
    echo -e "\t\e[1m-a\e[0m\tAdd script to /usr/local/bin . Make it executable in every directory.\n\t\tRequire \e[1msudo\e[0m access.\n"
    echo -e "\t\e[1m-r\e[0m\tRemove script from /usr/local/bin .\n\t\tRequire \e[1msudo\e[0m access.\n"
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
            ls -lh --color=auto /usr/local/bin/ ;;
        a)
            if [ -x ${OPTARG} ]; then
                NAME=$(basename ${OPTARG} | cut -d'.' -f1)
                sudo cp ${OPTARG} /usr/local/bin/${NAME}
                echo -e "Added [${NAME}] to /usr/local/bin/"
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} unvalid file: is not executable"
		        echo "Run « rfew -h » for more information" 
                exit 2
            fi ;;
        r)
            NAME=$(basename ${OPTARG} | cut -d'.' -f1)
            if [ -x /usr/local/bin/${NAME} ]; then
                sudo rm /usr/local/bin/${NAME}
                echo "Removed [${NAME}] from /usr/local/bin/"
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} unvalid file: no such file\n"
                echo "Files you can remove from /usr/local/bin/ :"
                ls --color=auto /usr/local/bin/ 
                exit 3
            fi ;;
        *)
            usage && exit 1 ;;
    esac
done
