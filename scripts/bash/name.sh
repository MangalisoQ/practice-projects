#! /bin/bash

set -e


function invalid_input () {
  echo "Invalid input." >&2
  exit 1
}

read -p "Enter name: " -a name

num_arg="${#name[@]}"


if [[ ${num_arg} -eq "0" || ${num_arg} -ge "2"  ]]; then
  invalid_input
fi

if [ "${#name[0]}" -eq "2" ]; then
  name="you"
fi

echo "One for ${name}, one for me."
