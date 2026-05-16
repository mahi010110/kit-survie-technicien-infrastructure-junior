# Diagnostic connexion utilisateur

## Symptôme

Un utilisateur n’arrive pas à ouvrir sa session, à se connecter à une application, au VPN, à la messagerie ou à une ressource interne. Il peut recevoir un message indiquant un identifiant incorrect, un mot de passe expiré, un compte verrouillé ou un accès refusé.

Exemples courants :

- impossible d’ouvrir une session Windows ;
- message « mot de passe incorrect » ;
- compte verrouillé après plusieurs essais ;
- connexion VPN refusée ;
- accès refusé à une application ou un partage ;
- demande d’authentification qui revient en boucle.

## Questions à poser

- À quel service l’utilisateur essaie-t-il de se connecter ?
- Le problème concerne-t-il Windows, VPN, messagerie, application métier ou partage réseau ?
- Depuis quand le problème est-il présent ?
- L’utilisateur a-t-il changé son mot de passe récemment ?
- Le message d’erreur exact est-il disponible ?
- L’utilisateur est-il sur site, en télétravail ou connecté au VPN ?
- Le problème se produit-il sur un seul poste ou sur plusieurs équipements ?
- D’autres utilisateurs ont-ils le même problème ?
- Le compte est-il nouveau, modifié récemment ou de retour après absence ?

## Vérifications simples

1. Vérifier l’identifiant utilisé : format court, adresse e-mail ou domaine selon le service.
2. Vérifier que Verr Maj et la disposition clavier ne provoquent pas une erreur de mot de passe.
3. Vérifier que le poste est connecté au réseau ou au VPN si nécessaire.
4. Vérifier la date et l’heure du poste.
5. Vérifier si l’utilisateur peut se connecter à un autre service avec les mêmes identifiants.
6. Vérifier si le problème apparaît sur un autre poste ou navigateur.
7. Vérifier si le compte semble verrouillé ou si le mot de passe est expiré, selon les outils autorisés.
8. Vérifier que l’utilisateur dispose bien des droits attendus pour la ressource.
9. Noter le message d’erreur exact et l’heure de l’essai.

## Commandes utiles

Dans l’invite de commandes Windows :

```cmd
whoami
hostname
ipconfig /all
ping <controleur_domaine_ou_serveur>
net use
```

Pour vérifier l’heure et le domaine :

```cmd
time /t
date /t
echo %USERDOMAIN%
echo %LOGONSERVER%
```

Dans PowerShell :

```powershell
whoami
Get-Date
Test-Connection <serveur> -Count 4
Get-PSDrive
```

Pour un test réseau simple :

```cmd
ping <passerelle>
ping <serveur_authentification>
nslookup <serveur_authentification>
```

## Interprétation

- Mot de passe refusé sur tous les services : mot de passe incorrect, expiré ou compte verrouillé probable.
- Connexion impossible uniquement sur le VPN : vérifier réseau Internet, client VPN, certificat ou droits VPN.
- Connexion impossible uniquement sur une application : problème de droits, profil applicatif ou serveur applicatif possible.
- Accès refusé à un partage mais session ouverte : droits d’accès ou groupe utilisateur à vérifier.
- Date ou heure incorrecte : l’authentification peut échouer.
- Plusieurs utilisateurs impactés : incident possible côté serveur, annuaire, réseau ou application.
- Demande de mot de passe en boucle : identifiants enregistrés incorrects, session expirée ou problème d’accès au service.

## Actions possibles

- Faire ressaisir calmement l’identifiant et le mot de passe en vérifiant le clavier.
- Demander à l’utilisateur de verrouiller puis rouvrir sa session si le mot de passe vient d’être changé.
- Redémarrer le poste si la session ou le cache d’identifiants semble bloqué.
- Reconnecter le VPN si l’accès dépend du réseau interne.
- Faire utiliser la procédure officielle de réinitialisation du mot de passe si nécessaire.
- Déverrouiller le compte uniquement avec les outils et autorisations prévus.
- Tester l’accès depuis un navigateur privé ou un autre poste si la procédure le permet.
- Supprimer des identifiants enregistrés uniquement si la procédure interne l’autorise.
- Noter les essais réalisés et éviter les tentatives répétées qui verrouillent le compte.

## Quand escalader

Escalader au niveau supérieur si :

- le compte se verrouille immédiatement après déverrouillage ;
- le mot de passe ne fonctionne sur aucun service après réinitialisation ;
- l’utilisateur a besoin d’un droit non attribué ;
- une application critique refuse l’accès malgré un compte valide ;
- plusieurs utilisateurs sont touchés ;
- un problème d’annuaire, de synchronisation ou de serveur d’authentification est suspecté ;
- les actions autorisées ne rétablissent pas l’accès.

Informations à transmettre lors de l’escalade :

- nom de l’utilisateur, identifiant, service et lieu ;
- ressource ou application concernée ;
- message d’erreur exact ;
- heure des essais ;
- type de connexion : sur site, Wi-Fi, VPN, télétravail ;
- tests réalisés et résultats ;
- impact métier et niveau d’urgence.
