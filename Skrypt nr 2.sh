#!/bin/bash
# Skrypt wczytuje liczby i wypisuje max., min. i sume

if [ $# -lt 1 ]; then           # jezeli nie podano argumentow
  echo "Podaj nazwe pliku!"
  exit
fi

if [ ! -f "$1" ]; then          # jezeli podany jako argument plik nie istnieje
  echo "Plik $1 nie istnieje!"
  exit
fi

rozmiar=`cat "$1" | wc -l`      # liczba wierszy w pliku
if [ $rozmiar -eq 0 ]; then     # jezeli liczba wierszy w pliku wynosi 0
  echo "Plik $1 jest pusty!"
  exit
fi

min=`cat "$1" | head -n 1`     # na poczatku max i min równają się pierwszej
max=$min                       #   liczbie w pliku
suma=0                         # na poczatku suma wynosi 0

while [ $rozmiar -gt 0 ]; do   # przeczytaj cały plik
  liczba=`cat "$1" | tail -n $rozmiar | head -n 1`  # pojedynczy wiersz pliku

  if [ $liczba -gt $max ]; then    # jeżeli liczba > niz dotychczasowy max
    max=$liczba                    #   max staje sie liczba
  elif [ $liczba -lt $min ]; then  # jeżeli liczba < niz dotychczasowy min
    min=$liczba                    #   min staje sie liczba
  fi

  suma=$[ $suma + $liczba]         # zwiekszamy sume o kolejna liczbe

  rozmiar=$[ $rozmiar - 1 ]        # rozmiar pliku zmniejszamy o 1
done

echo "Max. liczba $max"
echo "Min. liczba $min"
echo "Suma liczb $suma"
