<#
.SYNOPSIS
Teste rapidement la connectivité réseau d’un poste Windows.

.DESCRIPTION
Le script teste la passerelle par défaut, un serveur DNS et un site web.
Il affiche des résultats simples pour aider un diagnostic de premier niveau.

.EXAMPLE
.\tester-connectivite-reseau.ps1

.EXAMPLE
.\tester-connectivite-reseau.ps1 -DnsServer 1.1.1.1 -SiteWeb www.microsoft.com
#>

param(
    [string]$DnsServer = "8.8.8.8",
    [string]$SiteWeb = "www.example.com",
    [int]$NombrePing = 4,
    [int]$PortWeb = 443
)

Write-Host "=== Test de connectivité réseau ===" -ForegroundColor Cyan
Write-Host "Poste : $env:COMPUTERNAME"
Write-Host "Date  : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Write-Host ""

# Récupère la configuration IP principale.
$ConfigurationIp = Get-NetIPConfiguration |
    Where-Object { $_.IPv4DefaultGateway -ne $null } |
    Select-Object -First 1

if (-not $ConfigurationIp) {
    Write-Host "Aucune passerelle par défaut détectée." -ForegroundColor Yellow
    Write-Host "Vérifier la carte réseau, le câble, le Wi-Fi ou la configuration IP."
    exit 1
}

$AdresseIp = $ConfigurationIp.IPv4Address.IPAddress
$Passerelle = $ConfigurationIp.IPv4DefaultGateway.NextHop
$Interface = $ConfigurationIp.InterfaceAlias

Write-Host "Interface  : $Interface"
Write-Host "Adresse IP : $AdresseIp"
Write-Host "Passerelle : $Passerelle"
Write-Host "DNS testé  : $DnsServer"
Write-Host "Site testé : $SiteWeb"
Write-Host ""

function Tester-PingSimple {
    param(
        [string]$Nom,
        [string]$Cible
    )

    Write-Host "Test ping - $Nom ($Cible)"

    try {
        $Resultat = Test-Connection -ComputerName $Cible -Count $NombrePing -Quiet -ErrorAction Stop

        if ($Resultat) {
            Write-Host "OK : réponse reçue." -ForegroundColor Green
        }
        else {
            Write-Host "KO : aucune réponse." -ForegroundColor Red
        }
    }
    catch {
        Write-Host "KO : test impossible. $($_.Exception.Message)" -ForegroundColor Red
    }

    Write-Host ""
}

function Tester-PortTcp {
    param(
        [string]$Nom,
        [string]$Cible,
        [int]$Port
    )

    Write-Host "Test TCP - $Nom ($Cible sur port $Port)"

    try {
        $Resultat = Test-NetConnection -ComputerName $Cible -Port $Port -InformationLevel Quiet -WarningAction SilentlyContinue

        if ($Resultat) {
            Write-Host "OK : port accessible." -ForegroundColor Green
        }
        else {
            Write-Host "KO : port non accessible." -ForegroundColor Red
        }
    }
    catch {
        Write-Host "KO : test impossible. $($_.Exception.Message)" -ForegroundColor Red
    }

    Write-Host ""
}

# Teste d’abord le réseau local.
Tester-PingSimple -Nom "passerelle" -Cible $Passerelle

# Teste une adresse DNS publique ou interne.
Tester-PingSimple -Nom "serveur DNS" -Cible $DnsServer

# Teste la résolution DNS et l’accès web.
Tester-PingSimple -Nom "site web" -Cible $SiteWeb
Tester-PortTcp -Nom "site web" -Cible $SiteWeb -Port $PortWeb

Write-Host "Lecture rapide :" -ForegroundColor Cyan
Write-Host "- Passerelle KO : problème local possible."
Write-Host "- DNS joignable mais site KO : problème DNS ou filtrage possible."
Write-Host "- Port web KO : service distant, proxy ou pare-feu à vérifier."
Write-Host ""
Write-Host "Tests terminés."
