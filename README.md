# Kit de survie technicien infrastructure junior

Ce dépôt regroupe des fiches pratiques, des commandes, des scripts PowerShell simples et des modèles de documentation pour aider un technicien infrastructure junior à traiter des incidents courants de manière structurée.

Le contenu reste volontairement opérationnel et de niveau premier diagnostic : observer, vérifier, documenter, puis escalader si nécessaire.

## Objectif

L’objectif du projet est de fournir un support de travail clair pour :

- mener un diagnostic sans partir directement sur une hypothèse ;
- retrouver rapidement les commandes de base utiles ;
- garder une trace des vérifications réalisées ;
- préparer une escalade compréhensible vers un niveau supérieur ;
- progresser sur les bases Windows, réseau, PowerShell et exploitation.

## Contenu

Le dépôt contient les éléments suivants :

### Fiches pratiques

- [Diagnostic réseau](fiches-pratiques/diagnostic-reseau.md)
- [Diagnostic DNS](fiches-pratiques/diagnostic-dns.md)
- [Diagnostic imprimante](fiches-pratiques/diagnostic-imprimante.md)
- [Diagnostic disque plein](fiches-pratiques/diagnostic-disque-plein.md)
- [Diagnostic partage réseau](fiches-pratiques/diagnostic-partage-reseau.md)
- [Diagnostic connexion utilisateur](fiches-pratiques/diagnostic-connexion-utilisateur.md)
- [Diagnostic lenteur poste](fiches-pratiques/diagnostic-lenteur-poste.md)
- [Diagnostic poste Windows](fiches-pratiques/diagnostic-poste-windows.md)

### Commandes utiles

- [Commandes Windows](commandes/commandes-windows.md)
- [Commandes PowerShell](commandes/commandes-powershell.md)
- [Commandes réseau](commandes/commandes-reseau.md)

### Scripts PowerShell

- [Informations poste](scripts-powershell/infos-poste.ps1)
- [Vérifier l’espace disque](scripts-powershell/verifier-espace-disque.ps1)
- [Tester la connectivité réseau](scripts-powershell/tester-connectivite-reseau.ps1)

### Modèles et ressources

- [Checklist de prise de poste](modeles/checklist-prise-de-poste.md)
- [Compte rendu d’incident](modeles/compte-rendu-incident.md)
- [Procédure d’escalade](modeles/procedure-escalade.md)
- [Incidents informatique et production](contexte-industriel/incidents-informatique-et-production.md)
- [Bonnes pratiques](ressources/bonnes-pratiques.md)

## Pour qui

Ce kit s’adresse principalement :

- aux techniciens support ou infrastructure juniors ;
- aux alternants ou étudiants qui découvrent l’exploitation informatique ;
- aux personnes qui veulent structurer leurs diagnostics sur des incidents simples ;
- à toute personne ayant besoin d’un mémo opérationnel sur Windows, le réseau et les contrôles de base.

Il ne remplace pas les procédures internes d’une entreprise. Il sert plutôt de support personnel ou de base d’entraînement.

## Méthode de diagnostic

La méthode proposée repose sur une progression simple :

1. **Comprendre le symptôme** : qui est touché, depuis quand, sur quel poste ou service.
2. **Délimiter le périmètre** : un seul utilisateur, un service, un site, un réseau, une application.
3. **Vérifier les éléments de base** : alimentation, connexion réseau, session, espace disque, adresse IP, DNS, droits d’accès.
4. **Tester avec des commandes simples** : `ipconfig`, `ping`, `nslookup`, `Test-NetConnection`, observateur d’événements, services Windows.
5. **Comparer avec une situation connue** : autre poste, autre utilisateur, autre imprimante, autre partage.
6. **Documenter les résultats** : commandes lancées, messages d’erreur, captures utiles, heure des tests.
7. **Corriger si l’action est maîtrisée** ou **escalader** avec les informations nécessaires.

L’idée est d’éviter les actions au hasard et de garder une démarche lisible pour la suite du traitement.

## Utilisation

Le dépôt peut être utilisé comme un mémo de travail :

1. Choisir la fiche correspondant au symptôme observé.
2. Suivre les vérifications dans l’ordre proposé.
3. Utiliser les fichiers de commandes pour retrouver rapidement la syntaxe utile.
4. Lancer un script PowerShell uniquement si son rôle est compris et adapté au contexte.
5. Compléter un modèle de compte rendu si l’incident doit être suivi ou transmis.

Exemples :

```powershell
# Relever les informations principales du poste
.\scripts-powershell\infos-poste.ps1

# Vérifier l’espace disque avec le seuil par défaut
.\scripts-powershell\verifier-espace-disque.ps1

# Tester la connectivité réseau vers une cible précise
.\scripts-powershell\tester-connectivite-reseau.ps1 -DnsServer 1.1.1.1 -SiteWeb www.microsoft.com
```

Les scripts sont prévus pour PowerShell sur Windows. Ils doivent être exécutés dans un contexte autorisé, idéalement sans privilèges administrateur sauf besoin identifié.

## Structure

```text
.
├── commandes/
│   ├── commandes-powershell.md
│   ├── commandes-reseau.md
│   └── commandes-windows.md
├── contexte-industriel/
│   └── incidents-informatique-et-production.md
├── fiches-pratiques/
│   ├── diagnostic-connexion-utilisateur.md
│   ├── diagnostic-disque-plein.md
│   ├── diagnostic-dns.md
│   ├── diagnostic-imprimante.md
│   ├── diagnostic-lenteur-poste.md
│   ├── diagnostic-partage-reseau.md
│   ├── diagnostic-poste-windows.md
│   └── diagnostic-reseau.md
├── modeles/
│   ├── checklist-prise-de-poste.md
│   ├── compte-rendu-incident.md
│   └── procedure-escalade.md
├── ressources/
│   ├── bonnes-pratiques.md
│   └── glossaire.md
├── scripts-powershell/
│   ├── infos-poste.ps1
│   ├── tester-connectivite-reseau.ps1
│   └── verifier-espace-disque.ps1
└── README.md
```

## Limites

- Le contenu couvre des diagnostics courants et ne traite pas les architectures complexes en profondeur.
- Les scripts PowerShell restent simples et doivent être relus avant utilisation en environnement réel.
- Les commandes peuvent varier selon la version de Windows, les droits disponibles et les règles de sécurité internes.
- Les fiches ne remplacent pas l’analyse d’un administrateur confirmé ni les procédures de l’entreprise.
- Les exemples ne doivent pas être appliqués sans comprendre leur impact.

## Améliorations possibles

- Ajouter des fiches sur Active Directory, DHCP, VPN, sauvegarde et supervision.
- Ajouter des exemples de messages d’erreur fréquents et leur lecture.
- Ajouter une fiche de collecte d’informations avant escalade.
- Ajouter des variantes Linux pour certaines commandes réseau.
- Compléter les scripts avec une sortie fichier ou CSV.
- Ajouter une vérification automatisée des liens Markdown et de la syntaxe PowerShell.

## Licence

Voir le fichier [LICENSE](LICENSE).
