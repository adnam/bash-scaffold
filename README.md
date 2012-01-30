Bash Scaffold
=============

What: A quick-start BASH template script
Author: Adam Hayward <adam at happy dot cat>
License: http://svn.happy.cat/public/LICENSE.txt

Features:
- log "A log message"
- debug "A debug message only displayed if '-v' option passed"
- error "A fatal error message and exit with code:" 2
- usage - print a usage message
- get_options - parse command-line options, defaults below

Standard command-line options:
    -v verbose
    -h help message
    -V version number

Long-format options:
    --version
    --help
