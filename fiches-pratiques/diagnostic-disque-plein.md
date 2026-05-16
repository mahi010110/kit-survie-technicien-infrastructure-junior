# Diagnostic disque plein

## Symptôme

Un utilisateur signale que son poste est lent, qu’il ne peut plus enregistrer de fichiers, que certaines applications ne s’ouvrent plus ou que Windows affiche une alerte d’espace disque insuffisant.

Exemples courants :

- message « espace disque faible » ;
- impossible de télécharger, copier ou enregistrer un fichier ;
- mises à jour Windows bloquées ;
- application qui plante au démarrage ;
- session très lente ou profil qui ne se charge pas correctement.

## Questions à poser

- Depuis quand le message ou le ralentissement apparaît-il ?
- Le problème concerne-t-il le disque `C:` ou un autre lecteur ?
- L’utilisateur a-t-il copié récemment beaucoup de fichiers, photos, vidéos ou archives ?
- Le poste est-il utilisé par plusieurs personnes ?
- Des applications métier génèrent-elles des exports ou journaux volumineux ?
- L’utilisateur travaille-t-il avec OneDrive, un partage réseau ou des fichiers locaux ?
- Y a-t-il eu une mise à jour ou une installation récente ?
- Le problème empêche-t-il totalement le travail ou seulement certaines actions ?

## Vérifications simples

1. Vérifier l’espace libre dans l’explorateur de fichiers sur `Ce PC`.
2. Identifier le lecteur concerné, souvent `C:`.
3. Vérifier la taille des dossiers utilisateur : Bureau, Téléchargements, Documents, Images, Vidéos.
4. Vérifier si la corbeille est pleine.
5. Vérifier si des fichiers temporaires peuvent être supprimés avec l’outil Windows prévu.
6. Vérifier si OneDrive ou un outil de synchronisation garde beaucoup de fichiers en local.
7. Vérifier si le problème touche un seul poste ou plusieurs postes.
8. Noter l’espace total, l’espace utilisé et l’espace libre.

## Commandes utiles

Dans l’invite de commandes Windows :

```cmd
wmic logicaldisk get name,size,freespace
dir C:\ /a
```

Dans PowerShell :

```powershell
Get-PSDrive C
Get-ChildItem C:\Users -Directory | Select-Object Name,FullName
Get-ChildItem $env:TEMP | Measure-Object
```

Pour lancer l’outil de nettoyage Windows :

```cmd
cleanmgr
```

## Interprétation

- Moins de 10 % d’espace libre sur `C:` : le poste peut devenir lent ou instable.
- Quelques fichiers très volumineux dans `Téléchargements` ou `Vidéos` : nettoyage utilisateur possible après validation.
- Corbeille très remplie : vidage possible après accord de l’utilisateur.
- Fichiers temporaires nombreux : nettoyage via l’outil Windows recommandé.
- Espace plein sans cause visible : suspecter des journaux applicatifs, un cache, une synchronisation ou un problème système.
- Plusieurs postes touchés : suspecter une application, une mise à jour ou une stratégie de stockage.

## Actions possibles

- Demander à l’utilisateur de valider avant toute suppression de fichier personnel.
- Vider la corbeille avec l’accord de l’utilisateur.
- Supprimer les fichiers temporaires avec les outils Windows autorisés.
- Déplacer les fichiers personnels volumineux vers un partage réseau si la procédure le permet.
- Désinstaller uniquement les applications autorisées et inutiles selon la procédure interne.
- Nettoyer les anciens téléchargements après validation.
- Redémarrer le poste après nettoyage si des mises à jour étaient bloquées.
- Noter l’espace libre avant et après intervention.
- Ne pas supprimer de fichiers système, dossiers Windows ou dossiers applicatifs sans validation.

## Quand escalader

Escalader au niveau supérieur si :

- le disque reste plein après nettoyage simple ;
- l’espace se remplit à nouveau très rapidement ;
- le poste ne démarre plus correctement ;
- des erreurs disque apparaissent ;
- un dossier système ou applicatif semble anormalement volumineux ;
- le disque est trop petit pour l’usage demandé ;
- les actions autorisées ne suffisent pas à rétablir le service.

Informations à transmettre lors de l’escalade :

- nom du poste, utilisateur, service et lieu ;
- lecteur concerné, taille totale et espace libre ;
- dossiers volumineux identifiés ;
- messages d’erreur observés ;
- actions déjà réalisées ;
- impact pour l’utilisateur.
