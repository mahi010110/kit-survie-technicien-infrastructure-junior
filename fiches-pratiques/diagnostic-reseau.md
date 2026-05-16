# Diagnostic réseau de base

## Symptôme

Un utilisateur ou un poste n’accède plus au réseau, à Internet, à un serveur interne, à une imprimante réseau ou à une application métier.

Exemples courants :

- page web inaccessible ;
- lecteur réseau non disponible ;
- application qui ne se connecte plus au serveur ;
- imprimante réseau introuvable ;
- message « pas d’accès Internet » ou « réseau non identifié ».

## Questions à poser

- Depuis quand le problème est-il présent ?
- Le problème concerne-t-il un seul poste, plusieurs postes ou tout un service ?
- L’utilisateur est-il connecté en câble Ethernet ou en Wi-Fi ?
- Le poste a-t-il été déplacé récemment ?
- D’autres services fonctionnent-ils encore : messagerie, partage réseau, intranet, Internet ?
- Le problème est-il permanent ou intermittent ?
- Y a-t-il eu un changement récent : redémarrage, mise à jour, changement de câble, coupure électrique ?

## Vérifications simples

1. Vérifier le câble réseau et les voyants de la prise réseau.
2. Tester avec un autre câble si possible.
3. Vérifier que le Wi-Fi est bien connecté si le poste n’est pas câblé.
4. Redémarrer le poste si aucune vérification récente n’a été faite.
5. Vérifier si d’autres utilisateurs proches ont le même problème.
6. Tester l’accès à plusieurs ressources : site web, serveur interne, imprimante, partage réseau.
7. Vérifier que l’adresse IP semble correcte et non en `169.254.x.x`.
8. Vérifier que le poste n’est pas en mode avion ou connecté au mauvais réseau Wi-Fi.

## Commandes utiles

Sous Windows :

```cmd
ipconfig /all
ping 127.0.0.1
ping <adresse_IP_du_poste>
ping <passerelle>
ping 8.8.8.8
ping <nom_du_serveur>
nslookup <nom_du_serveur>
tracert <adresse_ou_nom>
```

## Interprétation

- `169.254.x.x` : le poste n’a probablement pas reçu d’adresse IP automatiquement.
- Pas de réponse au ping de `127.0.0.1` : problème local sur la pile réseau du poste.
- Ping de la passerelle impossible : problème entre le poste et le réseau local.
- Ping de la passerelle OK mais ping `8.8.8.8` impossible : problème de sortie réseau ou de routage.
- Ping `8.8.8.8` OK mais nom de serveur ou site web inaccessible : problème DNS possible.
- Un seul poste impacté : vérifier en priorité le poste, le câble, la carte réseau et la configuration IP.
- Plusieurs postes impactés : suspecter un équipement réseau, une baie, une borne Wi-Fi, un service DHCP/DNS ou une coupure plus large.

## Actions possibles

- Rebrancher correctement le câble réseau.
- Tester un autre port mural ou un autre câble si disponible.
- Désactiver puis réactiver la carte réseau.
- Redémarrer le poste.
- Renouveler l’adresse IP sous Windows :

```cmd
ipconfig /release
ipconfig /renew
```

- Vider le cache DNS sous Windows :

```cmd
ipconfig /flushdns
```

- Vérifier que le poste utilise la bonne configuration IP : adresse, masque, passerelle, DNS.
- Comparer la configuration avec un poste voisin qui fonctionne.
- Noter précisément les tests réalisés et les messages d’erreur observés.

## Quand escalader

Escalader au niveau supérieur si :

- plusieurs utilisateurs ou tout un service sont impactés ;
- le poste ne reçoit aucune adresse IP correcte malgré les vérifications simples ;
- la passerelle ne répond pas depuis plusieurs postes ;
- le DNS semble indisponible pour plusieurs utilisateurs ;
- un équipement réseau semble éteint ou en défaut ;
- le problème touche une application critique ou un serveur de production ;
- les actions de base n’ont pas permis de rétablir le service.

Informations à transmettre lors de l’escalade :

- utilisateur, poste, lieu et prise réseau si connue ;
- heure de début du problème ;
- nombre de personnes impactées ;
- type de connexion : câble ou Wi-Fi ;
- adresse IP, passerelle et DNS relevés ;
- résultats des commandes `ipconfig`, `ping`, `nslookup` ou équivalents ;
- actions déjà réalisées.
