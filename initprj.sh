#!/bin/bash

function usage {
    echo -e "\e[1mUsage:\e[0m\n\t\tinitprj [-h] [ -l language ] [ -n project_name ]\n"
    echo -e "\e[1mOptions:\e[0m"
    echo -e "\t\e[1m-h\e[0m\tPrint this help message and exit.\n"
    echo -e "\t\e[1m-l\e[0m\tInit specified [language] project directory.\n\t\tSupported languages : C, C++/Cpp, WEB (HTML-CSS-JS).\n"
    echo -e "\t\e[1m-n\e[0m\tInit project directory as [project_name] directory.\n"
    echo -e "\e[1mDescription:\e[0m"
    echo -e "\tInit Project (initprj) is a tool to create and initalize a new project directory corresponding to a programming language and a project name."
}

RED='\033[0;31m'
NC='\033[0m'
LANG=0

while getopts "hl:n:" options; do
    case ${options} in
        h)
            usage && exit 0 ;;
        l)
            # C
            if echo ${OPTARG} | grep -qi "^C$" ; then
                cp -r /home/raphael/Modèles/initprj/C_prj/ C_Project && LANG=1
            # C++
            if echo ${OPTARG} | grep -qi "^CPP$" | grep -qi "^C++$" ; then
                cp -r /home/raphael/Modèles/initprj/Cpp_prj/ Cpp_Project && LANG=1
            # WEB DEV
            elif echo ${OPTARG} | grep -qi "^WEB$" ; then
                cp -r /home/raphael/Modèles/initprj/WEB_prj/ WEB_Project && LANG=2
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} language not supported."
                echo "Run « initprj -h » for more information."
                exit 2
            fi ;;
        n)
            # C
            if [ ${LANG} -eq 1 ]; then
                mv C_Project/ ${OPTARG}/
                PRJ_NAME=${OPTARG}
                echo "# ${PRJ_NAME^^}" > ${PRJ_NAME}/README.md
            # WEB DEV
            elif [ ${LANG} -eq 2 ]; then
                mv WEB_Project/ ${OPTARG}/
            else
                mkdir -p ${OPTARG}
            fi 
            echo "Project directory [${OPTARG}] has been created." ;;
        *)
            usage && exit 1 ;;
    esac
done
