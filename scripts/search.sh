echo "Indiquez une partie des paroles à rechercher"
read lyrics
echo "Voici le résultat suivant le chemin genre/artiste/chanson"
 grep -Ril --include="*.txt" "$lyrics"


