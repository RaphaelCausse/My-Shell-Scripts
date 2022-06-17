#!/bin/bash

function usage {
    clear
    echo -e "${GRN}${BOLD}NAME${NT}${NC}"
    echo -e "\tinitprj - initialize a specific language project directory\n"
    echo -e "${GRN}${BOLD}SYNOPSIS${NT}${NC}"
    echo -e "\t./initprj.sh [${GRN}${BOLD}-h${NT}${NC}|${GRN}${BOLD}-i${NT}${NC}]"
    echo -e "\t./initprj.sh [${GRN}${BOLD}-n${NT}${NC} <${CYAN}project_name${NC}>] ${GRN}${BOLD}-l${NT}${NC} <${CYAN}language${NC}>\n"
    echo -e "${GRN}${BOLD}OPTIONS${NT}${NC}"
    echo -e "\t${GRN}${BOLD}-h${NT}${NC}\tdisplay this help message and exit\n"
    echo -e "\t${GRN}${BOLD}-i${NT}${NC}\tinstall this script in ~/.local/bin/ and move the initprj directory to ~/\n"
    echo -e "\t${GRN}${BOLD}-l${NT}${NC} ${CYAN}language${NC}"
    echo -e "\t\tinitialize a new ${CYAN}language${NC} project directory\n"
    echo -e "\t${GRN}${BOLD}-n${NT}${NC} ${CYAN}project_name${NC}"
    echo -e "\t\tname project directory as ${CYAN}project_name${NC}\n"
    echo -e "${GRN}${BOLD}GUIDE${NT}${NC}"
    echo -e "\t./initprj.sh -i"
    echo -e "\t./initprj.sh -n Test_initprj -l python\n"
    echo -e "${GRN}${BOLD}DESCRIPTION${NT}${NC}"
    echo -e "\tInitprj is a tool to create and initialize a specific language project directory.\n\tSupported languages : C, C++, Python, Web (HTML, CSS, JS)\n"
    echo -e "${GRN}${BOLD}AUTHOR${NT}${NC}"
    echo -e "\tWritten by Raphael CAUSSE.\n"
}

# Text modifier variables
BOLD='\e[1m'
NT='\e[0m'

# Text color variables
RED='\033[0;31m'
GRN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'
lang=""

# Get options
while getopts "hil:n:" options; do
    case ${options} in
        h)  # Help
            usage && exit 0 ;;
        i)  # Install
            cp -u $0 ~/.local/bin/initprj
            cp -ru initprj/ ~/.initprj/
            echo "Added 'initprj' to ~/.local/bin and ready to be used as command 'initprj'"
            exit 0 ;;
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
                echo -e "${RED}\e[1mError:\e[0m${NC} language ${OPTARG} is not supported."
                echo "Run « ./initprj.sh -h » for more information."
                exit 2
            fi ;;
        n)  # Directory name
            if [ ! -e "${OPTARG}" ]; then
                dir_name=${OPTARG}
            else
                echo -e "${RED}\e[1mError:\e[0m${NC} file or folder ${OPTARG} already exists here."
                echo "Run « ./initprj.sh -h » for more information."
                exit 3
            fi ;;
        *)
            usage && exit 1 ;;
    esac
done

# Using options to build project directory
if [ ! -z "${lang}" ]; then
    case ${lang} in
        "C")
            cp -r ~/.initprj/C_prj/ C_Project ;;
        "C++")
            cp -r ~/.initprj/Cpp_prj/ Cpp_Project ;;
        "Python")
            cp -r ~/.initprj/Py_prj/ Py_Project ;;
        "Web Dev")
            cp -r ~/.initprj/Web_prj/ Web_Project ;;
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
fi