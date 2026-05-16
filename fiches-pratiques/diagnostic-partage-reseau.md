# Diagnostic partage réseau

## Symptôme

Un utilisateur ne peut plus accéder à un partage réseau, à un lecteur réseau mappé ou à un dossier partagé sur un serveur.

Exemples courants :

- lecteur réseau avec une croix rouge ;
- message « accès refusé » ;
- message « chemin réseau introuvable » ;
- demande d’identifiants en boucle ;
- dossier partagé vide ou incomplet ;
- accès très lent à un partage ;
- application métier bloquée car elle utilise un chemin réseau.

## Questions à poser

- Depuis quand l’accès au partage ne fonctionne-t-il plus ?
- Le problème concerne-t-il un seul utilisateur, plusieurs utilisateurs ou tout un service ?
- Quel est le chemin exact du partage ? Exemple : `\\serveur\\partage`.
- L’utilisateur accède-t-il au partage par un lecteur réseau ou par un chemin UNC ?
- Le problème concerne-t-il tous les dossiers ou un dossier précis ?
- Un message d’erreur apparaît-il ? Si oui, lequel ?
- L’utilisateur a-t-il changé de mot de passe récemment ?
- L’utilisateur est-il connecté au réseau de l’entreprise ou en VPN ?
- Le poste a-t-il été redémarré récemment ?

## Vérifications simples

1. Vérifier que le poste est bien connecté au réseau ou au VPN.
2. Vérifier que d’autres ressources réseau fonctionnent : Internet, intranet, imprimante réseau.
3. Vérifier le chemin du partage et éviter les fautes de frappe.
4. Tester l’accès avec le chemin complet : `\\serveur\\partage`.
5. Vérifier si le lecteur réseau est simplement déconnecté.
6. Tester depuis un autre poste avec le même utilisateur si possible.
7. Tester avec un autre utilisateur autorisé depuis le même poste si possible.
8. Vérifier que l’utilisateur a bien les droits d’accès au dossier demandé.
9. Vérifier que l’heure du poste est correcte, surtout dans un domaine Windows.
10. Redémarrer le poste si les connexions réseau semblent bloquées.

## Commandes utiles

Sous Windows :

```cmd
ipconfig /all
ping <nom_du_serveur>
nslookup <nom_du_serveur>
net use
net use Z: \\<serveur>\\<partage>
net use Z: /delete
```

Avec PowerShell :

```powershell
Test-Connection <nom_du_serveur>
Resolve-DnsName <nom_du_serveur>
Test-NetConnection <nom_du_serveur> -Port 445
Get-SmbMapping
New-SmbMapping -LocalPath Z: -RemotePath "\\<serveur>\\<partage>"
Remove-SmbMapping -LocalPath Z:
```

## Interprétation

- `ping` du serveur impossible : problème réseau, DNS, serveur indisponible ou filtrage.
- `nslookup` échoue : le nom du serveur n’est pas résolu correctement par le DNS.
- Le port 445 ne répond pas : le service de partage SMB peut être bloqué, arrêté ou inaccessible.
- `accès refusé` : l’utilisateur est authentifié mais n’a probablement pas les droits nécessaires.
- Demande d’identifiants en boucle : mot de passe incorrect, compte verrouillé, session expirée ou conflit d’identifiants enregistrés.
- `chemin réseau introuvable` : nom du serveur, nom du partage, DNS ou connectivité à vérifier.
- Un seul utilisateur est impacté : suspecter les droits, le compte, le mot de passe ou le profil Windows.
- Plusieurs utilisateurs sont impactés : suspecter le serveur de fichiers, le réseau, le DNS ou une modification de droits.
- Le partage fonctionne par adresse IP mais pas par nom : problème DNS probable.

## Actions possibles

- Corriger le chemin du partage si une erreur de saisie est trouvée.
- Reconnecter le lecteur réseau depuis l’explorateur Windows.
- Supprimer puis recréer le lecteur réseau si le mappage est incorrect.
- Verrouiller puis rouvrir la session utilisateur après un changement de mot de passe.
- Redémarrer le poste si les anciennes connexions restent bloquées.
- Supprimer les connexions réseau obsolètes avec `net use <lettre>: /delete`.
- Vérifier que le VPN est connecté avant d’ouvrir le partage à distance.
- Comparer avec un poste ou un utilisateur qui accède correctement au même partage.
- Demander une validation métier avant toute modification de droits.
- Documenter le chemin testé, le message d’erreur exact et les commandes exécutées.

## Quand escalader

Escalader au niveau supérieur si :

- plusieurs utilisateurs ou tout un service n’accèdent plus au même partage ;
- le serveur ne répond pas au réseau ou au port SMB 445 ;
- le DNS ne résout plus le nom du serveur pour plusieurs postes ;
- l’utilisateur semble avoir besoin d’une modification de droits ;
- le compte utilisateur est verrouillé ou présente un problème d’authentification ;
- le partage contient des données critiques ou de production ;
- une suppression ou modification de droits est demandée ;
- les actions de base n’ont pas permis de rétablir l’accès.

Informations à transmettre lors de l’escalade :

- utilisateur, poste et lieu ;
- chemin exact du partage ;
- lettre du lecteur réseau si utilisée ;
- message d’erreur exact ;
- heure de début du problème ;
- nombre d’utilisateurs impactés ;
- état du VPN si applicable ;
- résultats de `ping`, `nslookup`, `Test-NetConnection` ou `net use` ;
- actions déjà réalisées.
