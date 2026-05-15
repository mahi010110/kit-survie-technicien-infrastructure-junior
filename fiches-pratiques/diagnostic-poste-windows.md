# Diagnostic poste Windows

## Symptôme

Un utilisateur signale qu’un poste Windows est lent, bloqué, ne démarre pas correctement, n’ouvre plus certaines applications, n’accède plus aux ressources habituelles ou affiche des messages d’erreur.

Exemples courants :

- session Windows très lente à l’ouverture ;
- application qui ne se lance pas ou se ferme seule ;
- écran figé ou poste qui redémarre ;
- imprimante, lecteur réseau ou messagerie indisponible ;
- message d’erreur Windows ou applicatif.

## Questions à poser

- Depuis quand le problème est-il présent ?
- Le problème est-il arrivé après une mise à jour, une installation ou un redémarrage ?
- Le problème concerne-t-il une seule application ou tout le poste ?
- L’utilisateur peut-il ouvrir sa session normalement ?
- D’autres utilisateurs ont-ils le même problème sur ce poste ou dans le service ?
- Le poste est-il connecté au réseau de l’entreprise ?
- Y a-t-il un message d’erreur exact à noter ou à capturer ?
- Le poste a-t-il été déplacé, éteint brutalement ou débranché récemment ?

## Vérifications simples

1. Vérifier que le poste est bien alimenté et que tous les câbles utiles sont branchés.
2. Redémarrer le poste si cela n’a pas déjà été fait proprement.
3. Vérifier si le clavier, la souris et l’écran répondent correctement.
4. Vérifier l’espace disque disponible sur le disque système.
5. Vérifier que la date et l’heure du poste sont correctes.
6. Tester l’ouverture de session avec l’utilisateur concerné si possible.
7. Tester une ressource simple : navigateur, explorateur de fichiers, application métier, lecteur réseau.
8. Comparer avec un autre poste du même service si le problème semble généralisé.
9. Noter les messages d’erreur exacts, l’heure et les actions qui déclenchent le problème.

## Commandes utiles

Dans l’invite de commandes Windows :

```cmd
hostname
whoami
ipconfig /all
ping 127.0.0.1
ping <passerelle>
ping <serveur_ou_site>
systeminfo
tasklist
```

Dans PowerShell :

```powershell
Get-ComputerInfo
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
Get-PSDrive C
Get-Service | Where-Object {$_.Status -ne "Running"}
Get-EventLog -LogName System -Newest 20
```

## Interprétation

- Le poste ne démarre pas du tout : suspecter l’alimentation, le câble, l’écran ou un problème matériel.
- La session s’ouvre mais reste très lente : vérifier l’espace disque, les applications ouvertes, les processus actifs et le réseau.
- Le disque `C:` est presque plein : Windows et les applications peuvent devenir instables.
- Plusieurs applications ne répondent pas : suspecter une saturation du poste, une mise à jour bloquée ou un problème système.
- Une seule application est en erreur : le problème peut être applicatif, lié au profil utilisateur ou à un accès serveur.
- Le réseau ne répond pas : traiter d’abord la connectivité avant de conclure à un problème Windows.
- Des erreurs système répétées dans les journaux : noter les messages et les horaires pour l’escalade.

## Actions possibles

- Redémarrer proprement le poste.
- Fermer les applications inutiles et vérifier si le poste redevient réactif.
- Libérer de l’espace disque avec les outils Windows autorisés par l’entreprise.
- Débrancher puis rebrancher les périphériques simples : clavier, souris, écran, câble réseau.
- Vérifier que l’utilisateur est sur le bon réseau et que le VPN est connecté si nécessaire.
- Relancer uniquement l’application en défaut si le reste du poste fonctionne.
- Tester avec un autre compte uniquement si la procédure interne l’autorise.
- Relever le nom du poste, l’utilisateur connecté, l’adresse IP et les messages d’erreur.
- Ne pas supprimer de fichiers système et ne pas modifier la configuration avancée sans validation.

## Quand escalader

Escalader au niveau supérieur si :

- le poste ne démarre pas ou redémarre en boucle ;
- l’utilisateur ne peut pas ouvrir sa session ;
- le disque semble défectueux ou le poste fait des bruits inhabituels ;
- le problème impacte plusieurs postes ou tout un service ;
- une application critique de production est indisponible ;
- des erreurs système répétées apparaissent sans cause simple ;
- les actions de base n’ont pas permis de rétablir le service.

Informations à transmettre lors de l’escalade :

- nom du poste, utilisateur, lieu et service ;
- heure de début du problème ;
- message d’erreur exact ou capture si disponible ;
- actions déjà réalisées ;
- résultats utiles de `ipconfig`, `systeminfo`, `tasklist` ou des journaux ;
- impact constaté : un utilisateur, plusieurs utilisateurs ou un service complet.
