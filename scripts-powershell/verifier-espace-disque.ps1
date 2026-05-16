<#
.SYNOPSIS
Vérifie l’espace disque disponible sur un poste Windows.

.DESCRIPTION
Le script affiche les lecteurs locaux, leur taille, l’espace libre et un état simple.
Il aide à repérer rapidement un disque presque plein.

.EXAMPLE
.\verifier-espace-disque.ps1

.EXAMPLE
.\verifier-espace-disque.ps1 -SeuilAlertePourcent 15
#>

param(
    [int]$SeuilAlertePourcent = 10
)

Write-Host "=== Vérification de l'espace disque ===" -ForegroundColor Cyan
Write-Host "Poste : $env:COMPUTERNAME"
Write-Host "Date  : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Write-Host "Seuil : alerte si l'espace libre est inférieur à $SeuilAlertePourcent %"
Write-Host ""

# Récupère les disques locaux visibles par Windows.
$Disques = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType = 3" |
    Sort-Object DeviceID

if (-not $Disques) {
    Write-Host "Aucun disque local détecté." -ForegroundColor Yellow
    exit 1
}

foreach ($Disque in $Disques) {
    $TailleGo = [math]::Round($Disque.Size / 1GB, 2)
    $LibreGo = [math]::Round($Disque.FreeSpace / 1GB, 2)

    if ($Disque.Size -gt 0) {
        $LibrePourcent = [math]::Round(($Disque.FreeSpace / $Disque.Size) * 100, 1)
    }
    else {
        $LibrePourcent = 0
    }

    Write-Host "Lecteur $($Disque.DeviceID)"
    Write-Host "  Nom          : $($Disque.VolumeName)"
    Write-Host "  Taille totale: $TailleGo Go"
    Write-Host "  Espace libre : $LibreGo Go ($LibrePourcent %)"

    # Compare l'espace libre avec le seuil choisi.
    if ($LibrePourcent -lt $SeuilAlertePourcent) {
        Write-Host "  Etat         : ALERTE - espace disque faible" -ForegroundColor Red
        Write-Host "  Action       : nettoyer les fichiers temporaires ou archiver des données"
    }
    else {
        Write-Host "  Etat         : OK" -ForegroundColor Green
    }

    Write-Host ""
}

Write-Host "Vérification terminée."
