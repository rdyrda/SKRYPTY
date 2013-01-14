#!/bin/bash
# Wersja 1.0
# Autor: Rafal Dyrda
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
