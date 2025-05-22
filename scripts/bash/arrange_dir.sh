#! /opt/homebrew/bin/bash
set -e

quiet=false
verbose=false
SCRIPT_FILENAME="${0##*/}"

# command line inputs
args_array=( "$@" )
DIR_PATH="${args_array[0]}"


DOCS_exts=( "pdf" "doc" "docx" "odt" "ppt" "pptx" "epub")
PICS_exts=( "png" "jpg" "jpeg" "gif" "tiff" "svg" "webp" )
AUDIO_exts=( "mp3" "mp4a" "wav" "aac" "flac" "ogg" "aiff" )
VIDS_exts=( "mp4" "mov" "avi" "wmv" "mkv" "flv" "webm" )
COMPR_exts=( "zip" "tar" "tar.gz" "tar.bz2" "rar" "tgz" )
TEXT_exts=( "sh" "txt" "py" "c" "cpp" "java" "go" "css" "html")

function invalid_input () {
  echo "Error: ${1}" >&2
  exit 1
}

# command line args 1. directory path 2. print unmoved file
function process_command_args () {
  if [[ -z "${args_array[0]}" ]] || [[ ! -d "${args_array[0]}" ]]; then
        invalid_input "Invalid Path: ${args_array[0]}"
  fi

  for command_arg in "${args_array[@]:1}"; do

     if [[ "$command_arg" == "--quiet" ]] || [[ "$command_arg" == "-q" ]]; then
       quiet=true
      fi
    
      if [[ "$command_arg" == "--verbose" ]] || [[ "$command_arg" == "-v" ]]; then
        verbose=true
      fi
  done
}

# If directory doesn't exit create one
function check_dir_exists () {
  local dir_names=( "Documents" "Videos" "Pictures" "Compressed" "Audio" "Text" )

  for dir in "${dir_names[@]}"; do
    if [[ ! -d "$dir"  ]]; then
      mkdir  "$DIR_PATH/$dir"
      echo "mkdir $DIR_PATH/$dir"
    fi
  done
}




function move_files_dir ()
{
    extention=$1

    moved_files=()

     for ext in ${DOCS_exts[@]}; do

     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Documents"
       moved_files+="$filename" 
       [[ "$verbose" ]] &&  echo "moved ${filename} to Documents"
       break
     fi
   done

   for ext in ${PICS_exts[@]}; do

    if [[ "$extention" == "$ext" ]]; then
      mv "$DIR_PATH/$filename" "$DIR_PATH/Pictures"
      moved_files+="$filename" 
       [[ "$verbose" ]] &&  echo "moved ${filename} to Pictures"
      break 
    fi
  done

    for ext in ${AUDIO_exts[@]}; do

     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Audio"
       moved_files+="$filename" 
        [[ "$verbose" ]] &&  echo "moved ${filename} to Audio"
       break 
     fi
   done

    for ext in ${VIDS_exts[@]}; do

     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Videos"
       moved_files+="$filename" 
        [[ "$verbose" ]] &&  echo "moved ${filename} to Videos"
       break
     fi
   done

    for ext in ${COMPR_exts[@]}; do
     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Compressed"
       moved_files+="$filename" 
        [[ "$verbose" ]] &&  echo "moved ${filename} to Compressed"
       break
     fi
   done

   for ext in ${TEXT_exts[@]}; do
     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Text"
       moved_files+="$filename" 
        [[ "$verbose" ]] &&  echo "moved ${filename} to Text"
       break
     fi
   done  
}

function prepare_files () {
  #files=( $(ls $DIR_PATH) )
  mapfile -t files < <(ls)
    
  for filename in "${files[@]}"; do
   if [[ "$filename" == "$SCRIPT_FILENAME" || "$filename" == "README.md" || -d "$filename" ]]; then
      continue   # skip script and README filanames
   fi
  
   # get file extention
   local extention="${filename##*.}"

   move_files_dir "$extention"

  done
  return 0
}

function print_unmoved_files () {
  for item in "${files[@]}"; do
    found=false
    for item2 in "${moved_files[@]}"; do
      if [[ "$item1" == "$item" ]]; then
        found=true
        break 
      fi
    done
    if [[ "$found" == "false" ]] && [[ ! -d "$item" ]]; then
      echo "$item"
    fi
  done
}

#############################
# Script File Entrypoint
##########################
process_command_args
check_dir_exists
prepare_files

if [[ "$quiet" == "false" ]]; then
  print_unmoved_files
fi
