<#
.SYNOPSIS
Affiche les informations utiles d’un poste Windows.

.DESCRIPTION
Le script regroupe des informations de base : nom du poste, utilisateur,
système, adresse IP, DNS et dernière date de démarrage.
Il sert de premier relevé lors d’un diagnostic.

.EXAMPLE
.\infos-poste.ps1
#>

Write-Host "=== Informations du poste ===" -ForegroundColor Cyan
Write-Host "Date du relevé : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Write-Host ""

# Informations générales du système.
$Systeme = Get-CimInstance -ClassName Win32_OperatingSystem
$Ordinateur = Get-CimInstance -ClassName Win32_ComputerSystem
$Bios = Get-CimInstance -ClassName Win32_BIOS

Write-Host "Poste" -ForegroundColor Cyan
Write-Host "  Nom du poste      : $env:COMPUTERNAME"
Write-Host "  Utilisateur       : $env:USERDOMAIN\$env:USERNAME"
Write-Host "  Domaine/Groupe    : $($Ordinateur.Domain)"
Write-Host "  Fabricant         : $($Ordinateur.Manufacturer)"
Write-Host "  Modèle            : $($Ordinateur.Model)"
Write-Host "  Numéro de série   : $($Bios.SerialNumber)"
Write-Host ""

Write-Host "Système" -ForegroundColor Cyan
Write-Host "  Nom               : $($Systeme.Caption)"
Write-Host "  Version           : $($Systeme.Version)"
Write-Host "  Architecture      : $($Systeme.OSArchitecture)"
Write-Host "  Dernier démarrage : $($Systeme.LastBootUpTime)"
Write-Host ""

# Affiche les cartes réseau avec une adresse IPv4.
$CartesReseau = Get-NetIPConfiguration |
    Where-Object { $_.IPv4Address -ne $null } |
    Sort-Object InterfaceAlias

Write-Host "Réseau" -ForegroundColor Cyan

if (-not $CartesReseau) {
    Write-Host "  Aucune adresse IPv4 détectée." -ForegroundColor Yellow
}
else {
    foreach ($Carte in $CartesReseau) {
        $AdressesDns = $Carte.DNSServer.ServerAddresses -join ", "

        Write-Host "  Interface         : $($Carte.InterfaceAlias)"
        Write-Host "  Adresse IPv4      : $($Carte.IPv4Address.IPAddress)"
        Write-Host "  Passerelle        : $($Carte.IPv4DefaultGateway.NextHop)"
        Write-Host "  Serveurs DNS      : $AdressesDns"
        Write-Host ""
    }
}

Write-Host "Relevé terminé."
