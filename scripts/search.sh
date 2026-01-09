echo "Indiquez une partie des paroles à rechercher :"
read -r lyrics
cd ..
echo "Voici le résultat suivant le chemin genre/artiste/chanson :"

grep -Ril --include="*.txt" -i "$lyrics" 