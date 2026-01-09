echo "Quel genre de musique?"
read GENRE
cd ../$GENRE
echo "Nom de l'artiste?"
read artist_name
cd "$artist_name"
echo "Quel est le titre de la chanson ?"
read titre
touch "$titre.txt"
echo $titre > "$titre.txt"

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
