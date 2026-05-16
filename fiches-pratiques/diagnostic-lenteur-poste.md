# Diagnostic lenteur poste

## Symptôme

Un utilisateur signale que son poste est lent : ouverture de session longue, applications qui répondent difficilement, navigation lente, fichiers qui mettent du temps à s’ouvrir ou écran qui se fige régulièrement.

Exemples courants :

- démarrage du poste très long ;
- session Windows lente après saisie du mot de passe ;
- applications qui affichent « ne répond pas » ;
- navigateur lent ou onglets bloqués ;
- souris ou clavier qui réagissent avec retard ;
- poste lent uniquement sur une application métier.

## Questions à poser

- Depuis quand la lenteur est-elle constatée ?
- La lenteur est-elle permanente ou seulement à certains moments ?
- Le problème concerne-t-il tout le poste ou une seule application ?
- Le poste a-t-il été redémarré récemment ?
- Y a-t-il eu une mise à jour, une installation ou un changement récent ?
- D’autres utilisateurs du même service ont-ils le même problème ?
- La lenteur apparaît-elle avec le réseau, le VPN ou hors connexion ?
- Un message d’erreur s’affiche-t-il ?

## Vérifications simples

1. Vérifier depuis combien de temps le poste n’a pas été redémarré.
2. Fermer les applications inutiles et observer si la situation s’améliore.
3. Vérifier l’espace libre sur le disque `C:`.
4. Vérifier l’utilisation du processeur, de la mémoire et du disque dans le Gestionnaire des tâches.
5. Vérifier si une mise à jour Windows est en cours ou en attente de redémarrage.
6. Vérifier si la lenteur existe avec un seul logiciel ou avec tout le poste.
7. Tester la connexion réseau si l’application lente dépend d’un serveur.
8. Comparer avec un autre poste du même service.
9. Noter les horaires, applications ouvertes et actions qui provoquent la lenteur.

## Commandes utiles

Dans l’invite de commandes Windows :

```cmd
hostname
systeminfo
tasklist
ipconfig /all
ping <serveur_ou_site>
```

Dans PowerShell :

```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10
Get-PSDrive C
Get-Service | Where-Object {$_.Status -ne "Running"}
Get-EventLog -LogName System -Newest 20
```

Commandes utiles côté réseau :

```cmd
ping <passerelle>
ping <serveur_applicatif>
tracert <serveur_applicatif>
```

## Interprétation

- Processeur à 100 % : une application ou un processus peut saturer le poste.
- Mémoire presque pleine : trop d’applications ouvertes ou poste sous-dimensionné.
- Disque `C:` presque plein : Windows peut devenir très lent.
- Disque utilisé à 100 % longtemps : mise à jour, antivirus, synchronisation ou problème disque possible.
- Lenteur uniquement avec une application réseau : vérifier la connectivité et le serveur applicatif.
- Lenteur après ouverture de session : suspecter les programmes au démarrage, lecteurs réseau ou scripts de connexion.
- Plusieurs postes impactés : problème possible côté réseau, serveur ou application.

## Actions possibles

- Redémarrer proprement le poste si cela n’a pas été fait récemment.
- Fermer les applications inutiles et limiter les onglets de navigateur.
- Libérer de l’espace disque si `C:` est presque plein.
- Laisser terminer une mise à jour en cours si elle est normale.
- Reconnecter le VPN ou le réseau si la lenteur concerne une ressource distante.
- Relancer uniquement l’application concernée si le reste du poste fonctionne.
- Noter les processus les plus consommateurs avant toute escalade.
- Ne pas arrêter de service système ou antivirus sans procédure validée.
- Ne pas supprimer de fichiers système pour gagner du temps.

## Quand escalader

Escalader au niveau supérieur si :

- le poste reste inutilisable après redémarrage et vérifications simples ;
- le disque, le processeur ou la mémoire reste saturé sans cause claire ;
- des erreurs système répétées apparaissent ;
- le poste redémarre ou se fige régulièrement ;
- plusieurs utilisateurs ou postes sont touchés ;
- une application critique est inutilisable ;
- un problème matériel est suspecté.

Informations à transmettre lors de l’escalade :

- nom du poste, utilisateur, service et lieu ;
- début du problème et fréquence ;
- applications concernées ;
- espace disque disponible ;
- processus les plus consommateurs ;
- messages d’erreur et journaux utiles ;
- actions déjà réalisées.
