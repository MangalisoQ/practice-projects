#! /bin/bash

set -e

function invalid_input ()
{
  err=$1
  echo "Error: ${err}" >&2
  exit 1
}

read -p "Enter strand both DNA strands: " -a dna_strands

if [[ "${#dna_strands[@]}" -ne "2" ]]; then
  invalid_input "Invalid Number of DNA Strands"
fi

if [[ "${#dna_strands[0]}" -ne "${#dna_strands[1]}" ]]; then
  invalid_input "DNA strands should be equal in length"
fi




echo "${dna_strands[0]}"
echo "${dna_strands[1]}"
echo "${#dna_strands[@]}"
echo "${#dna_strands[1]}"
