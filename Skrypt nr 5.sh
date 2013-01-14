#v+
#!/bin/bash
a=0
koment=""
while true; do
 read -s -n 1 b
 a=$(($a+1))
 case "$b" in
   ".")
   break
   ;;
   "")
   koment=$(echo "$koment ")
   ;;
   *)
   koment=$(echo "$koment$b")
   ;;
 esac
 if [ $a -eq 100 ]; then
   break
 fi
 clear
 echo "Pozostalo znakow: $((100-a)), Kropka konczy komentarz"
 echo "$koment"
done
clear
echo "wprowadziles: $koment"
#v-
