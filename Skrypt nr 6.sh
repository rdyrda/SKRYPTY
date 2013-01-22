#!/bin/bash

function pomoc
{
  echo -e "Program wyswietla menu, w którym wyiera sie 1 z 4 dzialan arytmetycznych po czym je wykonuje\n"
  echo "Skladnia: ./skrypt nr 1_0.sh lub"
  echo " ./skrypt nr 1_0.sh OPCJA"
  echo -e "\nDostepne opcje:\n\n -a Wyswietla informacje o autorze"
  echo -e "\n -h Wyswietla pomoc i liste opcji"
  echo -e "\n -v Wyswietla informacje o wersji programu"
  exit
}

#################################################

function wersja
{
  echo "Wersja 1.0"
  exit
}

#################################################

function autor
{
  echo "Autorem tego skryptu jest Rafal Dyrda"
  exit
}

#################################################

clear
echo -e "Zgadnij liczbe"
echo -e "Gra polega na odgadnieciu liczby z przedzialu od 1 do 5"
echo "Gre rozpoczynasz sie z kwota 100 zl. Za kazda prawidlowa odpowiedz +40 zl, z kolei bledna -20 zl."
echo "Wygrywasz zdobywajac 300 zl. Przegrywasz majac 0 zl."
echo""

kwota=100
zakres=5

until [ $kwota -le 0 ] || [ $kwota -ge 300 ]
do
    liczba=$RANDOM
    let "liczba%=$zakres"
    liczba=$[liczba + 1]
    
    echo -e "Posiadasz: $kwota zl"
    echo -n "Podaj cyfre: "
    read cyfra
    if [ $cyfra -eq $liczba ] 
    then
        echo -e "Brawo! Otrzymujesz +40 zl"
        echo ""
        kwota=$[kwota + 40]
    else 
        echo -e "Niestety. Tracisz -20 zl"
        echo ""
        kwota=$[kwota - 20]
    fi
done
if [ $kwota -eq 0 ]
then
    echo -e "PRZEGRALES. Straciles wszystkie pieniadze!"
else    
    echo -e "GRATULACJE! Wygrales 300 zl!"
fi

#################################################

while getopts ":a :h :v" opt
do
case "$opt"
in
h) pomoc >&2 ; exit;;
v) wersja >&2 ; exit;;
a) autor >&2 ; exit;;
\?) echo -e "Bledna opcja: -$OPTARG\nSprobuj -h zeby wyswietlic pomoc" >&2 ; exit;;
esac
done
