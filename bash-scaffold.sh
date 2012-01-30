#!/bin/bash
#------------------------------------------------------------------------------------
# What: A quick-start BASH template script
# Author: Adam Hayward <adam at happy dot cat>
# License: http://svn.happy.cat/public/LICENSE.txt
#
# Features:
#   log "A log message"
#   debug "A debug message only displayed if '-v' option passed"
#   error "A fatal error message and exit with code:" 2
#   usage - print a usage message
#   get_options - parse command-line options, defaults below
#
# Standard command-line options:
#   -v verbose
#   -h help message
#   -V version number
# Long-format options:
#   --version
#   --help  
#
#------------------------------------------------------------------------------------
#
# example-script.sh - Short description
# 
# author:       Author of script
# contact:	    Email
# since:        Date
# 
#------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------
# SCRIPT CONFIGURATION
#------------------------------------------------------------------------------------

SCRIPT_NAME=`basename $0`

# If debug information should be shown
VERBOSE=

VERSION=0.1

# Add your own global variables here
OP1=
OP2=

#------------------------------------------------------------------------------------
# UTILITY FUNCTIONS
#------------------------------------------------------------------------------------

# print a log a message
log ()
{
    echo "[${SCRIPT_NAME}]: $1" > /dev/stderr
}

# print a debug message - only outputs is VERBOSE flag is set
debug()
{
    [ "$VERBOSE" ] && echo "[${SCRIPT_NAME}]: $1" > /dev/stderr
}

# print an error message and exit()
error()
{
    echo "[${SCRIPT_NAME}] ERROR: $1" > /dev/stderr
    [ $# -gt 1 ] && exit $2
    exit 1
}

# Define your own script functions here

# Print a usage message
usage()
{
cat << USAGE
usage: $0 [-v] [-h] -a op1 -b op2

Short description

REQUIRED OPTIONS:
    -a op1      Option 1
    -b op2      Option 2
OTHER OPTIONS:
    -v         Show debuging messages
    -h         Show this help message
    -V         Show version
USAGE
}

# Get the script options
get_options()
{
    while getopts "a:b:hvV-:" OPTION
    do
        if [ $OPTION == "-" ]; then
            OPTION=$OPTARG
        fi
        case $OPTION in
            a)  OP1=${OPTARG};;
            b)  OP2=${OPTARG};;
            h)  usage && exit 0;;
       'help')  usage && exit 0;;
            V)  echo $VERSION && exit 0;;
    'version')  echo $VERSION && exit 0;;
            v)  VERBOSE=1;;
            \?) echo "Invalid option" && usage && exit 1;;
        esac
    done
}

main()
{
    get_options "$@"
    # Put the rest of your main script here
}

main "$@"

