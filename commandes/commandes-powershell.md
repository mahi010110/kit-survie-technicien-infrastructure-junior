# Commandes PowerShell utiles

Cette fiche présente des commandes PowerShell simples pour diagnostiquer un poste Windows.

## Aide et environnement

### Afficher la version de PowerShell

```powershell
$PSVersionTable
```

### Obtenir de l’aide sur une commande

```powershell
Get-Help <Commande>
Get-Help <Commande> -Examples
```

Exemple :

```powershell
Get-Help Get-Service -Examples
```

## Informations système

### Afficher les informations du poste

```powershell
Get-ComputerInfo
```

### Afficher le nom du poste

```powershell
$env:COMPUTERNAME
```

### Afficher l’utilisateur courant

```powershell
whoami
```

## Réseau

### Afficher les cartes réseau

```powershell
Get-NetAdapter
```

### Afficher la configuration IP

```powershell
Get-NetIPConfiguration
```

### Afficher les adresses DNS configurées

```powershell
Get-DnsClientServerAddress
```

### Tester un ping

```powershell
Test-Connection -ComputerName 8.8.8.8 -Count 4
```

### Tester un port TCP

```powershell
Test-NetConnection -ComputerName example.com -Port 443
```

Utile pour vérifier si un service distant répond sur un port précis.

## Services

### Lister les services

```powershell
Get-Service
```

### Rechercher un service

```powershell
Get-Service *spooler*
```

### Redémarrer un service

```powershell
Restart-Service -Name Spooler
```

À lancer en administrateur si le service le nécessite.

## Processus

### Lister les processus

```powershell
Get-Process
```

### Rechercher un processus

```powershell
Get-Process *chrome*
```

### Arrêter un processus par son ID

```powershell
Stop-Process -Id <PID>
```

Vérifier l’identifiant avant l’arrêt.

## Disques et fichiers

### Afficher les volumes

```powershell
Get-Volume
```

### Afficher l’espace disque

```powershell
Get-PSDrive -PSProvider FileSystem
```

### Lister un dossier

```powershell
Get-ChildItem
```

### Rechercher un fichier

```powershell
Get-ChildItem -Path C:\ -Filter "nom_fichier.txt" -Recurse -ErrorAction SilentlyContinue
```

## Journaux d’événements

### Lire les derniers événements système

```powershell
Get-EventLog -LogName System -Newest 20
```

### Lire les derniers événements applicatifs

```powershell
Get-EventLog -LogName Application -Newest 20
```

## Bonnes pratiques

- Lire la commande avant de l’exécuter.
- Utiliser `-WhatIf` quand la commande le permet.
- Éviter les scripts inconnus ou non validés.
- Copier les erreurs exactes pour faciliter l’escalade.
