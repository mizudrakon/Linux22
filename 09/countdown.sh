#!/bin/bash
set -ueo pipefail

on_exit() {
	echo -e "\nAborted"
	exit 17
}

for num in $(seq "$1" -1 1)
do
	trap "on_exit" INT QUIT TERM
	echo "$num"
	sleep 1s
done
