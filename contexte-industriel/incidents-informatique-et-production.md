# Incidents informatique et production

Dans une entreprise de production type Airfoils, l'informatique sert à accompagner le travail des opérateurs, des équipes qualité, de la logistique et des services support. Un incident informatique ne bloque pas toujours toute l'usine, mais il peut ralentir une étape, créer de l'attente ou compliquer le suivi de production.

L'objectif d'un technicien infrastructure junior est de comprendre l'impact concret, de vérifier les bases et de transmettre les bonnes informations si une escalade est nécessaire.

## Poste opérateur indisponible

Un poste opérateur peut servir à consulter une procédure, saisir une quantité produite, déclarer une opération ou accéder à une application métier.

Impact possible :

- l'opérateur ne peut pas enregistrer son travail immédiatement ;
- une déclaration de production peut être retardée ;
- le chef d'équipe doit trouver un autre poste ou une solution temporaire ;
- le suivi de l'activité peut être moins à jour.

Premiers réflexes :

- vérifier si le poste démarre correctement ;
- contrôler le câble réseau ou le Wi-Fi ;
- tester la connexion avec un autre compte si c'est autorisé ;
- noter le nom du poste, l'utilisateur concerné, l'heure et le message d'erreur.

## Imprimante d'étiquettes en erreur

Une imprimante d'étiquettes peut être utilisée pour identifier des pièces, des bacs, des lots ou des expéditions.

Impact possible :

- les produits ne peuvent pas être étiquetés au bon moment ;
- une zone d'expédition ou de contrôle peut être ralentie ;
- les opérateurs peuvent devoir attendre une réimpression ;
- le risque de confusion augmente si les étiquettes sont préparées manuellement sans méthode claire.

Premiers réflexes :

- vérifier l'alimentation, les voyants et les consommables ;
- contrôler le papier, le ruban et les bourrages ;
- relancer le travail d'impression si la procédure le permet ;
- tester depuis un autre poste pour savoir si le problème vient du poste ou de l'imprimante ;
- noter le nom de l'imprimante et le message affiché.

## Partage réseau inaccessible

Un partage réseau peut contenir des documents de production, des modèles, des rapports, des fichiers d'échange ou des procédures.

Impact possible :

- les utilisateurs ne retrouvent plus un document nécessaire ;
- un service peut perdre du temps à demander le fichier par un autre moyen ;
- une application qui dépend du partage peut fonctionner partiellement ;
- plusieurs utilisateurs peuvent être touchés en même temps.

Premiers réflexes :

- vérifier si un seul utilisateur est concerné ou toute une équipe ;
- tester l'accès au chemin réseau exact ;
- contrôler la connexion réseau du poste ;
- demander si le problème concerne un dossier précis ou tout le partage ;
- noter le chemin, le message d'erreur et les utilisateurs impactés.

## Problème DNS

Le DNS permet de retrouver un serveur ou un service à partir de son nom. Si le DNS ne répond pas correctement, certains accès peuvent échouer même si le réseau fonctionne.

Impact possible :

- une application ne s'ouvre plus avec son nom habituel ;
- un partage réseau par nom peut être inaccessible ;
- Internet ou l'intranet peut sembler instable ;
- les utilisateurs peuvent contourner le problème sans comprendre la cause.

Premiers réflexes :

- tester l'accès par nom puis, si connu, par adresse IP ;
- utiliser des commandes simples comme `ping` ou `nslookup` ;
- vérifier si le problème touche plusieurs postes ;
- relever le nom testé, l'adresse obtenue et le message d'erreur.

## Poste lent

Un poste lent peut faire perdre du temps à l'utilisateur sans provoquer une panne complète.

Impact possible :

- les saisies de production prennent plus de temps ;
- l'ouverture d'une application ou d'un fichier ralentit le travail ;
- l'utilisateur peut répéter les clics et créer des erreurs ;
- le support reçoit des demandes difficiles à qualifier si rien n'est mesuré.

Premiers réflexes :

- demander depuis quand la lenteur est présente ;
- vérifier si toutes les applications sont lentes ou seulement une ;
- contrôler l'espace disque, la mémoire et l'utilisation du processeur ;
- redémarrer le poste si c'est compatible avec l'activité en cours ;
- noter les symptômes observés et les horaires.

## Accès utilisateur bloqué

Un utilisateur peut être bloqué par un mot de passe expiré, un compte verrouillé, un droit manquant ou un problème de session.

Impact possible :

- l'utilisateur ne peut pas accéder à son poste ou à une application ;
- une tâche de production, de contrôle ou de logistique peut être retardée ;
- un autre collègue peut devoir prendre le relais temporairement ;
- une mauvaise attribution de droits peut empêcher une action précise.

Premiers réflexes :

- identifier l'utilisateur, le poste et l'application concernée ;
- vérifier le message exact affiché ;
- distinguer un problème de mot de passe d'un problème de droits ;
- respecter les procédures internes pour les réinitialisations et les habilitations ;
- ne jamais utiliser le compte d'un autre utilisateur pour contourner le problème.

## Comment évaluer l'impact simplement

Pour rester clair dans un compte rendu, on peut se poser quatre questions :

1. Qui est touché : une personne, une équipe, un atelier ?
2. Qu'est-ce qui ne fonctionne plus : poste, application, imprimante, partage, compte ?
3. Quelle activité est ralentie : saisie, impression, contrôle, expédition, consultation ?
4. Existe-t-il une solution temporaire validée : autre poste, autre imprimante, procédure papier, attente planifiée ?

Un bon diagnostic junior ne cherche pas à dramatiser. Il décrit les faits, l'impact réel et les vérifications réalisées.
