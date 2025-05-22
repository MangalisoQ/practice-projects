#! /bin/bash

set -e

read -p "Enter a number: " number

ans=""

if [[ $((number % 3)) == "0" ]]; then
  ans+="Pling"
fi

if [[ $((number % 5)) == "0" ]]; then
  ans+="Plang"
fi  

if [[ $((number % 7)) == "0" ]]; then
  ans+="Plong"
fi

if [[ -z "$ans" ]]; then
  echo $number
else
  echo "$ans"
fi
