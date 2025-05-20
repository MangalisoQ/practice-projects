#! /usr/bin/env python3

import sys
import os
from constants import *
import shutil


def directory_path():
    return sys.argv[1]

def verbose():
    for c_arg in sys.argv[1:]:
        if c_arg == "--verbose" or c_arg == "-v":
            return True
    return False

def quiet():
    for c_arg in sys.argv[1:]:
        if c_arg == "--quiet" or c_arg == "-q":
            return False
    return True

def validate_command_arg():
    if len(sys.argv) < 2:
        print("Error: Missing Path")
        sys.exit(1)

    if not (os.path.isdir(directory_path())):
        print(f"Error: Invalid Path: {directory_path()}")
        sys.exit(1)

def dir_exist():
    directories = ["Documents","Text","Audio","Videos", "Compressed", "Pictures"]

    for dir in directories:
        if not (os.path.isdir(dir)):
            os.mkdir(f"{directory_path()}/{dir}")
            print(f"Create {directory_path()}/{dir}") if verbose() else None

def move_files():
    dir_list = os.listdir(directory_path())
    

    for filename in dir_list:
        if os.path.isdir(filename) or filename == "main.py" or filename =="constants.py":
            continue


        name ,extention = os.path.splitext(filename)
        try:
            if extention in DOCS_EXTENSIONS:
                shutil.move(f"{directory_path()}/{filename}",f"{directory_path()}/Documents")
                print(f"Move {filename} to {directory_path()}/Documents") if verbose() else None
            elif extention in AUDIO_EXTENSIONS:
                shutil.move(f"{directory_path()}/{filename}",f"{directory_path()}/Audio")
                print(f"Move {filename} to {directory_path()}/Audio") if verbose() else None
            elif extention in VIDS_EXTENSIONS:
                shutil.move(f"{directory_path()}/{filename}",f"{directory_path()}/Videos")
                print(f"Move {filename} to {directory_path()}/Videos") if verbose() else None
            elif extention in PICS_EXTENSIONS:
                shutil.move(f"{directory_path()}/{filename}",f"{directory_path()}/Pictures")
                print(f"Move {filename} to {directory_path()}/Pictures") if verbose() else None
            elif extention in COMPR_EXTENSIONS:
                shutil.move(f"{directory_path()}/{filename}",f"{directory_path()}/Compressed")
                print(f"Move {filename} to {directory_path()}/Compressed") if verbose() else None
            elif extention in TEXT_EXTENSIONS:
                shutil.move(f"{directory_path()}/{filename}",f"{directory_path()}/Text")
                print(f"Move {filename} to {directory_path()}/Text") if verbose() else None
            else:
                if quiet(): print(filename)
        except OSError:
            print(f"File ({filename}) already exists at the destination")
    




    



def main():
    validate_command_arg()
    dir_exist()
    move_files()
    


if __name__ == "__main__":
    main()