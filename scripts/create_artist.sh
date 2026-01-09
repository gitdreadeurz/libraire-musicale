echo "Quel genre de musique ?"
read GENRE
GENRE=$(echo "$GENRE" | tr '[:upper:]' '[:lower:]')

echo "Nom de l'artiste ?"
read artist_name
artist_name=$(echo "$artist_name" | tr '[:upper:]' '[:lower:]')

cd ..
mkdir -p "$GENRE/$artist_name"