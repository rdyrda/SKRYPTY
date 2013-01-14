#!/bin/sh
# Wersja 1
# Autor: Rafal Dyrda
echo "Podaj pierwsza liczbe"
read a
echo "Podaj druga liczbe"
read b
if [ -z "$a" -z "$b" ];
then
echo "\nZmienne nie moga byc puste !"
else
echo -e "\nPodaj dzialanie, ktore chcesz wykonac\n(+) dodawanie\n(-) odejmowanie\n(*) mnozenie\n(/) dzielenie\n(inny znak) wszystkie dzialania "
read c
if [ "$c" = "+" ];
then
echo -n "$a + $b = "
expr $a + $b
elif [ "$c" = "-" ];
then
echo -n "$a - $b = "
expr $a - $b
elif [ "$c" = "*" ];
then
echo -n "$a * $b = "
expr $a \* $b
elif [ "$c" = "/" ];
then
if [ "$b" = "0" ];
then
echo "Nie mozna dzielic przez 0!"
else
echo -n "$a / $b = "
expr $a / $b
fi
else
echo -n "$a + $b = "
expr $a + $b
echo -n "$a - $b = "
expr $a - $b
echo -n "$a * $b = "
expr $a \* $b
if [ "$b" = "0" ];
then
echo "\nNie mozna dzielic przez 0!"
else
echo -n "$a / $b = "
expr $a / $b
fi;fi;fi

