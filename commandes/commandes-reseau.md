# Commandes réseau utiles

Cette fiche regroupe des commandes simples pour diagnostiquer un problème réseau courant sur un poste utilisateur.

## Windows

### Afficher la configuration IP

```cmd
ipconfig
ipconfig /all
```

À vérifier :

- adresse IPv4 ;
- masque de sous-réseau ;
- passerelle par défaut ;
- serveurs DNS ;
- présence éventuelle d’une adresse `169.254.x.x`.

### Tester la pile réseau locale

```cmd
ping 127.0.0.1
```

Si ce test échoue, le problème est probablement local au poste.

### Tester la connexion au réseau local

```cmd
ping <passerelle>
```

Exemple :

```cmd
ping 192.168.1.1
```

Si la passerelle ne répond pas, vérifier le câble, le Wi-Fi, la carte réseau ou la configuration IP.

### Tester la sortie vers Internet par adresse IP

```cmd
ping 8.8.8.8
```

Si ce test fonctionne mais pas les noms de sites, le problème peut venir du DNS.

### Tester la résolution DNS

```cmd
nslookup <nom_du_serveur>
nslookup www.example.com
```

Permet de vérifier si un nom est bien transformé en adresse IP.

### Suivre le chemin réseau

```cmd
tracert <adresse_ou_nom>
```

Exemple :

```cmd
tracert 8.8.8.8
```

Utile pour voir où la communication s’arrête.

### Renouveler l’adresse IP

```cmd
ipconfig /release
ipconfig /renew
```

À utiliser si le poste semble avoir une mauvaise adresse IP ou une adresse automatique `169.254.x.x`.

### Vider le cache DNS

```cmd
ipconfig /flushdns
```

À utiliser si un nom de serveur ou de site semble résoudre vers une mauvaise adresse.

### Afficher les connexions réseau actives

```cmd
netstat -ano
```

Utile pour voir les connexions établies et les ports utilisés par le poste.

## Linux

### Afficher les interfaces réseau

```bash
ip addr
```

À vérifier :

- interface active ;
- adresse IP ;
- état `UP` ou `DOWN` ;
- adresse anormale ou absente.

### Afficher la route par défaut

```bash
ip route
```

À vérifier :

- présence d’une route `default` ;
- adresse de la passerelle.

### Tester la pile réseau locale

```bash
ping 127.0.0.1
```

### Tester la passerelle

```bash
ping <passerelle>
```

### Tester une adresse Internet

```bash
ping 8.8.8.8
```

### Tester la résolution DNS

```bash
nslookup <nom_du_serveur>
nslookup www.example.com
```

Si `nslookup` n’est pas disponible, essayer :

```bash
host <nom_du_serveur>
```

### Suivre le chemin réseau

```bash
traceroute <adresse_ou_nom>
```

Si `traceroute` n’est pas installé, la commande peut être absente selon la distribution.

## Lecture rapide des résultats

- Adresse `169.254.x.x` : adresse automatique, DHCP probablement non reçu.
- Pas de passerelle : le poste ne sait pas sortir de son réseau local.
- Ping passerelle KO : problème local, câble, Wi-Fi, configuration IP ou équipement réseau proche.
- Ping IP externe OK mais nom KO : problème DNS probable.
- Tout fonctionne sur un poste voisin : problème probablement limité au poste ou à sa prise réseau.
- Plusieurs postes touchés : incident réseau plus large à signaler.

## Bonnes pratiques

- Toujours noter la commande lancée et le résultat important.
- Comparer avec un poste qui fonctionne dans la même zone.
- Ne pas modifier une configuration IP fixe sans validation.
- Faire des tests simples avant d’escalader.
- Transmettre les résultats exacts en cas d’escalade.
