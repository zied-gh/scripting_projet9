#!/bin/bash
show_usage() {
	echo -e "$0 [-h|--help][-T][-t][-n][-N][-d][-m][-s] chemin.."
}
HELP() {
	cat help.txt
}
minuscule() {

for i in $@; do mv -i $i `echo $i | tr 'A-Z' 'a-z'`; done
echo "\nOperation done successfully!\n"
}
renommer_espace() {
for f in *\ *; do mv "$f" "${f// /_}"; done
echo "\nOperation done successfully!\n"
}
AUTEURS() {
echo "Code crée pour le projet du scripting 2021/2022"
echo "Par Ben Amor Sameh et Ghanem Zied"
echo "Ver code: 0.01V"
}


enlever_extension() {
name=$(echo "$2" | cut -f 1 -d '.')
mv -- "$2" "$name"
}

MENU2() {
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=7
BACKTITLE="Menu graphique"
TITLE="Renommer les fichiers"
MENU="Choisir l'un des options:"
OPTIONS=(1 "Renommer tous les fichiers ou repertoires en minuscule"
	 2 "Renommer les fichiers dont les noms contient un espace"
	 3 "Enlever l'extension de nom de fichier"
	 4 "Renommer tous les fichiers our repertoires en majuscule"
	 5 "Ajouter _d au noms des repertoires passer en parametres"
	 6 "Changer l'extension de fichier passer en parametres"
	 7 "Quitter")
CHOICE=$(dialog --clear \
		--backtitle "$BACKTITLE" \
		--title "$TITLE" \		
		--menu "$MENU" \
		$HEIGHT $WIDTH $CHOICE_HEIGHT \
		"${OPTIONS[@]}" \
		2>&1 >/dev/tty)

case $? in 
	1) minuscule "$@"
	;;
	2) renommer_espace
	;;
	3) enlever_extension "$@"
	;;
	4) majuscule "$@"
	;;
	5) renommer_repertoire "$@"
	;;
	6) renommer_extension "$@"
	;;
	7) exit
	;;
esac
}

majuscule() {
for f in $@; do mv -- "$f" "$(tr [:lower:] [:upper:] <<< "$f")" ; done
}
renommer_repertoire() {
var="_d"
for d in $@ ; do
name="$d"
mv -- "$d" "${name}${var}"
done
}
renommer_extension() {
name=$(echo "$2" | cut -f 1 -d '.')
mv -- "$2" "$name.$3"
}
MENU() {
while [[ $choix -ne 7 ]]
do

echo -e "\n1: Renommer tous les fichiers ou repertoires en minuscule /
	 \n2: Renommer les fichiers dont les noms contient un espace /
	 \n3: Enlever l'extension de nom de fichier /
	 \n4: Renommer tous les fichiers our repertoires en majuscule /
	 \n5: Ajouter _d au noms des repertoires passer en parametres /
	 \n6: Changer l'extension de fichier passer en parametres /
	 \n7: Quitter"
read -p "Donner un choix compris entre 1 et 6, tappez 7 pour quitter" choix

case $choix in
	1) minuscule "$@"
	;;
	2) renommer_espace
	;;
	3) enlever_extension "$@"
	;;
	4) majuscule "$@"
	;;
	5) renommer_repertoire "$@"
	;;
	6) renommer_extension "$@"
	;;
	7) exit
	;;
esac
done
}
if [ $# -le 0 ]
	then
		show_usage
	exit 1
	fi

if [[ ($1 == "--help") ]]
	then
		HELP
	fi
if [[ ($1 == "-h") ]]
	then
		HELP
	exit 1
	fi


if [[ ($1 == "-v") ]]
	then
		AUTEURS
	exit 0
	fi
if [[ ($1 == "-g") ]]
	then
		MENU3 "$@"
	exit 0
	fi

if [[ ($1 == "-s") ]]
	then
		renommer_extension "$@"
clear
		echo "done"
	exit 0
	fi

if [[ ($1 == "-d") ]]
	then
		renommer_repertoire "$@"
clear
		echo "done"
	exit 0
	fi

if [[ ($1 == "-t") ]]
	then
		enlever_extension "$@"
clear
		echo "done"
	exit 0
	fi


if [[ ($1 == "-T") ]]
	then
		renommer_espace "$@"
		clear
		echo "done"
	exit 0
	fi

if [[ ($1 == "-M") ]]
	then
		majuscule "$@"
		clear
		echo "done"
	exit 0
	fi

if [[ ($1 == "-N") ]]
	then
		minuscule "$@"
clear
		echo "done"
	exit 0
	fi
if [[ ($1 == "-m") ]]
	then
		MENU "$@"
	exit 0
	fi
