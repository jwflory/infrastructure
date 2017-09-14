#!/usr/bin/bash
#
# Script to synchronize log files from a user's ZNC directory into a non-
# privileged folder for use with an analysis tool like pisg
#
# Author: Justin W. Flory
# Version: 2017.09.13.v1
#

# Parse arguments
while [[ $# -gt 1 ]]; do
    key="$1"
    
    case $key in
        -i|--input-dir)
        INPUT_DIR="$2"
        shift # past argument
        ;;
        -o|--output-dir)
        OUTPUT_DIR="$2"
        shift # past argument
        ;;
        -u|--user)
        NEW_USER="$2"
        shift # past argument
        ;;
        --default)
        DEFAULT=YES
        ;;
        *)
                # unknown option
        ;;
    esac
    shift # past argument or value
done

if [ $DEFAULT = "YES" ]; then
    echo "No arguments specified. Specify input directory, output directory, and chown user."
fi

# Make sure output directory exists
if [ ! -d i"$OUTPUT_DIR" ]; then
    mkdir $OUTPUT_DIR
fi

# Synchronize logs from input to output
rsync -ra $INPUT_DIR $OUTPUT_DIR
chown -R $NEW_USER:$NEW_USER $OUTPUT_DIR
