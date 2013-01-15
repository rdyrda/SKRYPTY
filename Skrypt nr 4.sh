#!/bin/bash
# Program dzieli plik na czesci po `rozmiar' wierszy.

if [ $# -ne 2 ]; then
    echo 'bledna liczba parametrow !'
    exit
fi

rozmiar=`wc -l "$1"`
rozmiar=${rozmiar% *}

Nplk=0
while [ $[ $2 * $Nplk ] -lt $rozmiar ]; do

    cat "$1" | tail -n $[ $rozmiar - $2 * $Nplk ] | head -n $2 
    echo '-------'

    Nplk=$[ $Nplk + 1 ]

done
