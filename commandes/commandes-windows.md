# Commandes Windows utiles

Cette fiche regroupe des commandes simples à utiliser sur un poste Windows pour un premier diagnostic.

## Informations système

### Afficher la version de Windows

```cmd
winver
```

Ouvre une fenêtre avec la version installée.

```cmd
systeminfo
```

Affiche des informations détaillées : nom du poste, domaine, mémoire, correctifs, démarrage système.

## Gestion du poste

### Afficher le nom du poste

```cmd
hostname
```

Utile pour vérifier que l’on intervient sur la bonne machine.

### Afficher l’utilisateur connecté

```cmd
whoami
```

Permet de confirmer le compte utilisé.

### Verrouiller la session

```cmd
rundll32.exe user32.dll,LockWorkStation
```

À utiliser avant de quitter un poste.

## Services

### Lister les services

```cmd
sc query
```

### Vérifier un service précis

```cmd
sc query <nom_du_service>
```

Exemple :

```cmd
sc query spooler
```

### Redémarrer le spouleur d’impression

```cmd
net stop spooler
net start spooler
```

À utiliser avec prudence si un problème d’impression est signalé.

## Processus et tâches

### Afficher les processus

```cmd
tasklist
```

### Arrêter un processus par son PID

```cmd
taskkill /PID <numero_pid> /F
```

Exemple :

```cmd
taskkill /PID 1234 /F
```

Vérifier le PID avant d’arrêter un processus.

## Disques et fichiers

### Afficher les lecteurs

```cmd
wmic logicaldisk get name,filesystem,freespace,size
```

Permet de voir l’espace libre sur les disques.

### Vérifier un disque

```cmd
chkdsk C:
```

Affiche un état rapide du système de fichiers.

### Lister le contenu d’un dossier

```cmd
dir
```

### Changer de dossier

```cmd
cd <chemin>
```

Exemple :

```cmd
cd C:\Windows\Temp
```

## Réseau rapide

### Afficher la configuration IP

```cmd
ipconfig /all
```

### Tester une adresse

```cmd
ping <adresse>
```

### Tester la résolution DNS

```cmd
nslookup <nom_dns>
```

## Journaux et outils graphiques

### Ouvrir l’observateur d’événements

```cmd
eventvwr.msc
```

### Ouvrir la gestion de l’ordinateur

```cmd
compmgmt.msc
```

### Ouvrir les services

```cmd
services.msc
```

## Bonnes pratiques

- Lancer l’invite de commandes en administrateur seulement si nécessaire.
- Noter la commande utilisée et le message d’erreur exact.
- Ne pas arrêter un service ou un processus sans savoir à quoi il sert.
- Comparer avec un poste fonctionnel si possible.
