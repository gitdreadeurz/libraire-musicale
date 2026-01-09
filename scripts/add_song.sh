echo "Quel genre de musique?"
read GENRE
cd ../$GENRE

# Vérification du genre
if [ ! -d "../$GENRE" ]; then
    echo "Erreur : le genre '$GENRE' n'existe pas."
    exit 1
fi

cd "../$GENRE" || exit 1

echo "Nom de l'artiste?"
read artist_name
cd "$artist_name"

# Vérification de l'artiste
if [ ! -d "$artist_name" ]; then
    echo "Erreur : l'artiste '$artist_name' n'existe pas dans le genre '$GENRE'."
    exit 1
fi

cd "$artist_name" || exit 1

echo "Quel est le titre de la chanson ?"
read titre
touch "$titre.txt"
echo $titre > "$titre.txt"


# Suggestion d'ajout de chanson

echo "Avez vous des paroles de chanson à rajouter ? "
options=("Oui" "Non")
select choix in "${options[@]}"; do
    case $REPLY in
        1)  read paroles ;;
        2)  break
        ;;
        *)
            echo "Réponse invalide, veuillez réessayer !"
            ;;
    esac
done

echo $paroles >> "$titre.txt"
echo "Veuillez ajouter des informations (Durée,année ...)"
read informations
echo $informations >> "$titre.txt"
