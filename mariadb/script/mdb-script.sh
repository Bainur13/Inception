#!/bin/bash

# Démarrer MySQL
service mysql start

# Créer la base de données si elle n'existe pas
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Créer l'utilisateur s'il n'existe pas (en vérifiant manuellement)
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Accorder les privilèges à l'utilisateur (sur toutes les connexions %)
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Changer le mot de passe de l'utilisateur root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Recharger les privilèges
mysql -e "FLUSH PRIVILEGES;"

# Arrêter le serveur MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Redémarrer MySQL en mode sécurisé
exec mysqld_safe