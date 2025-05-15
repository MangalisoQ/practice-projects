#! /bin/bash
set -e

DIR_PATH="$1"
SCRIPT_FILENAME="${0##*/}"

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

     for ext in ${DOCS_exts[@]}; do

     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Documents"
       break
     fi
   done

   for ext in ${PICS_exts[@]}; do

    if [[ "$extention" == "$ext" ]]; then
      mv "$DIR_PATH/$filename" "$DIR_PATH/Pictures"
      break 
    fi
  done

    for ext in ${AUDIO_exts[@]}; do

     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Audio"
       break 
     fi
   done

    for ext in ${VIDS_exts[@]}; do

     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Videos"
       break
     fi
   done

    for ext in ${COMPR_exts[@]}; do
     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Compressed"
       break
     fi
   done

   for ext in ${TEXT_exts[@]}; do
     if [[ "$extention" == "$ext" ]]; then
       mv "$DIR_PATH/$filename" "$DIR_PATH/Text"
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

check_dir_exists
prepare_files
