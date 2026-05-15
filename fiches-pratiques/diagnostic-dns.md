# Diagnostic DNS

## Symptôme

Un utilisateur ou un poste peut accéder à certaines ressources par adresse IP, mais pas par nom. Les sites web, applications internes, lecteurs réseau ou serveurs ne répondent plus quand on utilise leur nom habituel.

Exemples courants :

- un site web ne s’ouvre pas alors que la connexion réseau semble active ;
- une application ne trouve pas son serveur ;
- un lecteur réseau avec un nom de serveur ne se connecte plus ;
- un ping vers une adresse IP fonctionne, mais pas vers un nom ;
- message du type « nom introuvable », « serveur DNS ne répond pas » ou « impossible de résoudre le nom ».

## Questions à poser

- Depuis quand le problème est-il présent ?
- Le problème concerne-t-il un seul poste, plusieurs postes ou tout un service ?
- Le problème touche-t-il un seul nom ou tous les sites et serveurs ?
- L’utilisateur est-il sur le réseau local, en Wi-Fi, en VPN ou à distance ?
- Le poste a-t-il changé de réseau récemment ?
- D’autres services réseau fonctionnent-ils encore avec une adresse IP ?
- Le problème est-il permanent ou intermittent ?
- Y a-t-il eu un changement récent : mise à jour, changement DNS, incident réseau, coupure électrique ?

## Vérifications simples

1. Vérifier que le poste est bien connecté au réseau.
2. Vérifier si Internet ou les ressources internes fonctionnent sur un autre poste.
3. Tester l’accès à un site connu et à une ressource interne connue.
4. Tester si une adresse IP répond alors que le nom ne répond pas.
5. Vérifier que l’adresse IP, la passerelle et les serveurs DNS sont renseignés.
6. Vérifier que le poste n’a pas une adresse en `169.254.x.x`.
7. Vérifier que le VPN est connecté si le nom à résoudre est interne à l’entreprise.
8. Comparer les DNS configurés avec ceux d’un poste voisin qui fonctionne.
9. Noter le nom exact qui ne se résout pas et le message d’erreur obtenu.

## Commandes utiles

Sous Windows :

```cmd
ipconfig /all
nslookup <nom_du_serveur>
nslookup <nom_du_serveur> <adresse_DNS>
ping <nom_du_serveur>
ping <adresse_IP>
tracert <nom_du_serveur>
ipconfig /displaydns
```

Sous Linux :

```bash
ip addr
ip route
cat /etc/resolv.conf
nslookup <nom_du_serveur>
dig <nom_du_serveur>
ping <nom_du_serveur>
ping <adresse_IP>
```

## Interprétation

- `ping <adresse_IP>` fonctionne mais `ping <nom>` échoue : problème DNS probable.
- `nslookup` ne répond pas : le serveur DNS configuré est peut-être inaccessible.
- `nslookup` répond avec une mauvaise adresse IP : vérifier le nom utilisé ou demander une vérification de l’enregistrement DNS.
- Un seul poste est impacté : suspecter la configuration DNS locale, le cache DNS ou le VPN.
- Plusieurs postes sont impactés : suspecter le serveur DNS, le réseau, le DHCP ou un changement de configuration.
- Les noms Internet fonctionnent mais pas les noms internes : vérifier le VPN, les DNS internes et le domaine utilisé.
- Les noms courts ne fonctionnent pas mais les noms complets fonctionnent : problème possible de suffixe DNS.

## Actions possibles

- Vérifier que le poste utilise les bons serveurs DNS.
- Déconnecter puis reconnecter le VPN si le problème concerne des noms internes.
- Vider le cache DNS sous Windows :

```cmd
ipconfig /flushdns
```

- Renouveler la configuration IP si elle est fournie automatiquement :

```cmd
ipconfig /release
ipconfig /renew
```

- Tester avec le nom complet si disponible, par exemple `serveur.domaine.local`.
- Comparer la configuration DNS avec un poste qui fonctionne.
- Redémarrer le poste si le cache ou la configuration semble bloqué.
- Noter les serveurs DNS utilisés, le nom testé et les résultats de `nslookup`.
- Ne pas modifier les DNS manuellement sans respecter la procédure interne.

## Quand escalader

Escalader au niveau supérieur si :

- plusieurs utilisateurs ou plusieurs sites sont impactés ;
- un serveur DNS ne répond pas depuis plusieurs postes ;
- un nom critique de production ne se résout plus ;
- la résolution donne une adresse IP incorrecte ;
- le problème concerne le domaine, l’authentification ou des services internes sensibles ;
- les actions de base n’ont pas permis de rétablir la résolution DNS.

Informations à transmettre lors de l’escalade :

- poste, utilisateur, lieu et type de connexion ;
- heure de début du problème ;
- nom exact testé et adresse IP attendue si connue ;
- serveurs DNS configurés ;
- résultats de `ipconfig /all`, `nslookup`, `ping` et tests VPN ;
- nombre d’utilisateurs ou de postes impactés ;
- actions déjà réalisées.
