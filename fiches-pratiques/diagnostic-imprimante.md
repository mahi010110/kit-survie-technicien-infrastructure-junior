# Diagnostic imprimante

## Symptôme

Un utilisateur ne peut pas imprimer, l’imprimante ne répond pas, les documents restent bloqués dans la file d’attente ou l’impression sort avec un défaut.

Exemples courants :

- imprimante affichée hors connexion ;
- document bloqué en attente ;
- message d’erreur au lancement de l’impression ;
- impression très lente ;
- pages blanches, tachées ou incomplètes ;
- imprimante introuvable dans la liste des imprimantes.

## Questions à poser

- Depuis quand le problème est-il présent ?
- Le problème concerne-t-il un seul utilisateur ou plusieurs personnes ?
- L’utilisateur imprime-t-il toujours sur la même imprimante ?
- Le problème concerne-t-il tous les documents ou un fichier précis ?
- Un message d’erreur apparaît-il ? Si oui, lequel ?
- L’imprimante a-t-elle été déplacée, redémarrée ou remplacée récemment ?
- Y a-t-il eu un changement récent sur le poste : mise à jour, changement de mot de passe, nouveau pilote ?
- Les copies ou les scans fonctionnent-ils encore si l’imprimante est multifonction ?

## Vérifications simples

1. Vérifier que l’imprimante est allumée et sans message d’erreur sur l’écran.
2. Vérifier le papier, les cartouches ou toners, les bacs et les bourrages papier.
3. Vérifier les câbles : alimentation, USB ou réseau selon le type d’imprimante.
4. Si imprimante réseau, vérifier que le câble réseau est branché et que les voyants sont actifs.
5. Vérifier que le poste est bien connecté au réseau.
6. Vérifier que l’utilisateur sélectionne la bonne imprimante.
7. Vérifier si l’imprimante est marquée « hors connexion » ou « suspendue ».
8. Imprimer une page de test depuis Windows si possible.
9. Tester depuis un autre poste pour savoir si le problème est local ou général.
10. Redémarrer l’imprimante si aucune impression n’est en cours de production importante.

## Commandes utiles

Sous Windows :

```cmd
control printers
ipconfig /all
ping <adresse_IP_imprimante>
nslookup <nom_imprimante>
```

Avec PowerShell :

```powershell
Get-Printer
Get-PrintJob -PrinterName "<nom_imprimante>"
Test-NetConnection <adresse_IP_imprimante> -Port 9100
```

Pour vider une file d’attente bloquée, à utiliser avec prudence :

```cmd
net stop spooler
net start spooler
```

Sous Linux :

```bash
lpstat -p
lpstat -o
ping <adresse_IP_imprimante>
```

## Interprétation

- L’imprimante ne s’allume pas : problème d’alimentation, de prise ou de matériel.
- Message papier, toner ou bourrage : problème physique à traiter avant le diagnostic réseau.
- Un seul poste est impacté : suspecter la file d’attente, le pilote, l’imprimante par défaut ou le profil utilisateur.
- Plusieurs postes sont impactés : suspecter l’imprimante, le réseau, le serveur d’impression ou le service d’impression.
- Ping impossible vers l’imprimante réseau : problème réseau, adresse IP incorrecte ou imprimante éteinte.
- Ping OK mais impression impossible : problème de pilote, de file d’attente, de port d’impression ou de serveur d’impression.
- Impression possible depuis un autre poste : le problème est probablement local au poste de l’utilisateur.
- Copies locales impossibles sur une multifonction : le problème est probablement matériel ou consommable.

## Actions possibles

- Retirer le bourrage papier et recharger correctement le papier.
- Remplacer ou réinstaller correctement le toner ou la cartouche si nécessaire.
- Relancer l’impression après avoir supprimé les travaux bloqués.
- Définir la bonne imprimante par défaut.
- Désactiver l’option « utiliser l’imprimante hors connexion » si elle est activée.
- Redémarrer l’imprimante, puis attendre qu’elle soit complètement prête.
- Redémarrer le poste si la file d’attente locale semble bloquée.
- Redémarrer le service de spouleur d’impression si autorisé par les procédures internes.
- Supprimer puis réinstaller l’imprimante si le pilote ou le port semble incorrect.
- Comparer la configuration avec un poste qui imprime correctement.
- Noter le nom exact de l’imprimante, son adresse IP et les messages affichés.

## Quand escalader

Escalader au niveau supérieur si :

- plusieurs utilisateurs ne peuvent plus imprimer sur la même imprimante ;
- l’imprimante réseau ne répond pas au ping malgré les vérifications physiques ;
- le serveur d’impression semble indisponible ;
- le spouleur d’impression se bloque de façon répétée ;
- un message matériel persiste après les vérifications simples ;
- le pilote doit être remplacé mais nécessite des droits administrateur ;
- l’imprimante est critique pour un service ou une production ;
- les actions de base n’ont pas permis de rétablir l’impression.

Informations à transmettre lors de l’escalade :

- utilisateur, poste et lieu ;
- nom de l’imprimante et adresse IP si connue ;
- heure de début du problème ;
- nombre d’utilisateurs impactés ;
- message exact affiché sur le poste ou l’imprimante ;
- résultat du ping ou des tests d’impression ;
- actions déjà réalisées.
