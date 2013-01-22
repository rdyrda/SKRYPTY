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

echo "Podaj pierwsza liczbe"
read a
echo "Podaj druga liczbe"
read b
if [ -z "$a" -o -z "$b" ] 
then
  echo "Zmienne nie moga byc puste !"
else
  echo -e "\nPodaj dzialanie, ktore chcesz wykonac:"
fi
select c in 'dodawanie' 'odejmowanie' 'mnozenie' 'dzielenie'
do
  case $c in
    'dodawanie') echo -n "$a + $b = "  
  		 expr $a + $b ;;
    'odejmowanie') echo -n "$a - $b = " 
		   expr $a - $b ;;
    'mnozenie') echo -n "$a * $b = "  
		expr $a \* $b ;;
    'dzielenie') if [ "$b" = "0" ]
		 then
		   echo "Nie mozna dzielic przez 0!"
		 else 
		   echo -n "$a / $b = "
		   expr $a / $b 
		 fi ;;
    *) echo -e "Nie wybrales nic sposrod wymienionych"
  esac
  break
done 

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
