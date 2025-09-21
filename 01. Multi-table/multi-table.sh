#!/usr/bin/env bash

# written in vi

if [ $# -ne 2 ]; then
  echo "Invalid input"
  exit 1
fi

rows="$1"
cols="$2"

if ! [[ "$rows" =~ ^-?[0-9]+$ && "$cols" =~ ^-?[0-9]+$ ]]; then
  echo "Invalid input"
  exit 1
fi

if [ "$rows" -le 0 ] || [ "$cols" -le 0 ]; then
  echo "Input must be greater than 0"
  exit 1
fi

for ((i=1; i<=rows; i++)); do
  for ((j=1; j<=cols; j++)); do
    prod=$((i*j))
    if [ $j -eq 1 ]; then
      printf "%d*%d=%d" "$i" "$j" "$prod"
    else
      printf "   %d*%d=%d" "$i" "$j" "$prod"
    fi
  done
  printf "\n"
done
