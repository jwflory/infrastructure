#!/usr/bin/python3
#
# Simple program to search for a string in a file and replace it with
# a new string. The original use case for this script was when the
# Minecraft server changed worlds. This meant introducing multiple
# worlds with strings like 'world' and now 'world_new' into thousands
# of player data files. This script solves this problem by searching
# and replacing all the strings to make them consistent.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
__author__ = 'Justin W. Flory'

import argparse, fileinput, os, shutil

def searchreplace():
    """
    Simple program to search for a string in a file and replace it with a new
    string.
    """

    # Set up parameter handling
    parser = argparse.ArgumentParser(description=
                                    'Find and replace strings in a text file.')
    parser.add_argument('--file', '-f', nargs='+', required=True,
                        metavar='<file name>', dest='player_file',
                        help='file to search and replace strings')
    parser.add_argument('--word', '-w', required=True,
                        metavar='<original word>', dest='word',
                        help='original word to be replaced')
    parser.add_argument('--replace-with', '-r', required=True,
                        metavar='<replacing word>', dest='new_word',
                        help='new word to replace with')

    # Convert passed parameters to local variables
    args = parser.parse_args()
    player_file = args.player_file
    word = args.word
    new_word = args.new_word

    # Replace the old string with the new string
    with fileinput.FileInput(player_file, inplace=True, backup='.bak') as file:
        for line in file:
            print(line.replace(word, new_word), end='')

    # Move backup files to a new directory
    if not os.path.isdir('./backups'):
        os.mkdir('./backups')
    for f in os.listdir('.'):
        if f.endswith('.bak'):
            shutil.move(f, './backups')

if __name__ == "__main__":
   searchreplace()
