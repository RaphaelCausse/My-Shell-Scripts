#!/bin/bash

function usage {
    echo -e "\e[1mUsage:\e[0m\n\t\tinitprj [-h] [ -l language ] [ -n project_name ]\n"
    echo -e "\e[1mOptions:\e[0m"
    echo -e "\t\e[1m-h\e[0m\tPrint this help message and exit.\n"
    echo -e "\t\e[1m-l\e[0m\tInit specified [language] project directory.\n\t\tSupported languages : C, C++, Python, Web (HTML-CSS-JS).\n"
    echo -e "\t\e[1m-n\e[0m\tInit project directory as [project_name] directory.\n"
    echo -e "\e[1mDescription:\e[0m"
    echo -e "\tInit Project (initprj) is a tool to create and initalize a specified language project directory."
}

# Color variables
RED='\033[0;31m'
NC='\033[0m'
lang=""

# Get options
while getopts "hl:n:" options; do
    case ${options} in
        h)  # Help
            usage && exit 0 ;;
        l)  # Language
            if echo ${OPTARG} | grep -qi "^C$" ; then
                lang="C"
            elif echo ${OPTARG} | grep -qi "^C++$\|^CPP$" ; then
                lang="C++"
            elif echo ${OPTARG} | grep -qi "^PYTHON$\|^PY$" ; then
                lang="Python"
            elif echo ${OPTARG} | grep -qi "^WEB$" ; then
                lang="Web Dev"
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} language not supported."
                echo "Run « initprj -h » for more information."
                exit 2
            fi ;;
        n)  # Directory name
            dir_name=${OPTARG} ;;
        *)
            usage && exit 1 ;;
    esac
done

# Using options to build project directory
if [ ! -z "${lang}" ]; then
    case ${lang} in
        "C")
            cp -r /home/raphael/Modèles/initprj/C_prj/ C_Project ;;
        "C++")
            cp -r /home/raphael/Modèles/initprj/Cpp_prj/ Cpp_Project ;;
        "Python")
            cp -r /home/raphael/Modèles/initprj/Py_prj/ Py_Project ;;
        "Web Dev")
            cp -r /home/raphael/Modèles/initprj/Web_prj/ Web_Project ;;
        *)  ;;
    esac
fi       

if [ ! -z "$dir_name" ]; then
    case ${lang} in
        "C")
            mv C_Project/ ${dir_name} ;;
        "C++")
            mv Cpp_Project/ ${dir_name} ;;
        "Python")
            mv Py_Project/ ${dir_name} ;;
        "Web Dev")
            mv Web_Project/ ${dir_name} ;;
        *)
            mkdir -p ${dir_name} ;;
    esac
    echo "# ${dir_name^^}" >> ${dir_name}/README.md
    echo "[${lang}] Project directory '${dir_name}' has been created."
else
    echo "[${lang}] Project directory has been created."
fi