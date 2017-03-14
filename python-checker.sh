#!/bin/bash
#
# Check if Python is installed
# And check Python version
#
# Written by <sys0dm1n> - 2017
#
required_python_version=3.5.2

if which python3 > /dev/null 2>&1; then
        echo "python3 is installed"
        function version { echo "$@" | gawk -F. '{ printf("%03d%03d%03d\n", $1,$2,$3); }'; }
        current_python_version=`python3 -c 'import sys; print(".".join(map(str, sys.version_info[:3])))'`

        if [ "$(version "$current_python_version")" -gt "$(version "$required_python_version")" ]; then
                echo "$current_python_version is greater than $required_python_version !"
        elif [ "$(version "$required_python_version")" -gt "$(version "$current_python_version")" ]; then
                echo "$required_python_version is greater than $current_python_version !"
        elif [ "$(version "$required_python_version")" -eq "$(version "$current_python_version")" ]; then
                echo "$required_python_version is equal to  $current_python_version !"
        fi
else
        echo "python3 is not installed"
# Add Python3 installation here!
fi
