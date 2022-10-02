Job 6 : 
-Le script fonctionne actuellement uniquement avec des chiffres entiers
-Le caractère 'x' est utilisé pour les multiplications
-Le caractère '/' est utilisé pour les divisions
-Les divisions fonctionnent comme des divisions euclidiennes, sans prendre en compte le reste (modulo)

Job 8 :
-Le cron est tel quel : 0 */1 * * * /bin/bash /home/fel/Dev/git/shell.exe/Job_8/get_logs.sh
-Il s'exécute toutes les heures à la minute 0
-Quand le script est lancé avec le cron, il le fait à partir du dossier personnel
-Pour ne pas recréer tout le chemin au moment de l'archiver, je crée le fichier dans le dossier personnel 
-Puis je teste s'il se trouve dans le dossier personnel, si c'est le cas je le déplace dans mon fichier Job 8 puis l'archive
