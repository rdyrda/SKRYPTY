#!/bin/bash
# Autor: Rafal Dyrda
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
