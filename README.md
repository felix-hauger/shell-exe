Job 6 : 
-Le script fonctionne actuellement uniquement avec des chiffres entiers
-Le caractère 'x' est utilisé pour les multiplications
-Le caractère '/' est utilisé pour les divisions
-Les divisions fonctionnent comme des divisions euclidiennes, sans prendre en compte le reste (modulo)

Job 8 :
-Le cron est tel quel : 0 */1 * * * /bin/bash /home/fel/Dev/git/shell.exe/Job_8/get_logs.sh
-Il s'exécute toutes les heures à la minute 0
-Quand le script est lancé avec le cron, il le fait à partir du dossier personnel
-Quand le script est lancé avec le cron, pour ne pas recréer tout le chemin au moment de l'archiver, il crée le fichier dans le dossier personnel 
-Enfin le script teste si le fichier se trouve dans le dossier personnel, si c'est le cas il est déplacé dans le fichier Job_8, puis est archivé
