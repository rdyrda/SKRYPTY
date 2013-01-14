#!/bin/bash
# ./skr8 katalog
# Program dla kazdego podkatalogu zadanego katalogu wyswietla
# sumaryczna wielkosc znajdujacych sie tam plikow.

if [ $# -ne 1 ]; then
    echo 'zla liczba parametrow !'
    echo './skr8 katalog'
    exit
fi

for i in `find "$1" -type d`; do
   tmp=0
   for j in `find "$i" -type f -printf "%s "`; do
       tmp=$[ $tmp + $j ]  
   done 
   echo "$i  $tmp"
done
