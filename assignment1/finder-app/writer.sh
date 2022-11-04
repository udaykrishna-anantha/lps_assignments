#!/bin/bash

Help() { echo "    Usage: $0 [FILENAME_PATH] [STRING_TO_WRITE]" 1>&2; exit 1; }

if [ $# -lt 2 ]
then
    usage
fi

if [ $1 ]
then
    filename=$1
    dir_name=$(dirname $1)
    echo "given directory"
    echo $dir_name
    filename="${filename##*/}"

else
    echo "First parameter needs to be a directory path which includes file name also."
    usage
fi

if [ $2 ] && [ -n $2 ]
then
    writestr=$2
else
    echo "Second parameter needs to be a string or data to be writen to file."
    Help
fi

if [[ ! -d $dir_name ]]
then
    mkdir -p $dir_name
fi

if [ $? -eq 0 ] && ([ -n $filename ] && [ ! -e $1 ])
then
    touch $1
fi

if [ -d $dir_name ] && ([ -n $filename ] && [ -w $1 ])
then
    echo $writestr > $1
else
    echo "File doesn't exist or does not have write permissions."
fi


