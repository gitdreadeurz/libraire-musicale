echo "Quel genre de musique?"
read GENRE    
echo "Nom de l'artiste?"
read "artist_name"
cd ..
mkdir -p $GENRE/"$artist_name"
