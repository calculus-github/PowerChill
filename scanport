
param(
[string]$cible = "google.fr",
[int]$numerodeport = 80
)
# variable pour determiner l'etat de l'hote et stocker ces infos en variable.
$requete = Test-NetConnection $cible -Port $numerodeport -InformationLevel Quiet
# attendre pour affichage
Write-Host "debut du scan sur le port" $numerodeport
sleep 2
for(){
if($requete -eq $true)
{# Afficher le port ouvert et passer au suivant
    Write-Host "[RUNNING]" -ForegroundColor Magenta
    Write-Host -ForegroundColor Black -BackgroundColor Green "Port ouvert" : $numerodeport;$numerodeport++
    $requete=Test-NetConnection -Port  $numerodeport -ComputerName $cible -InformationLevel Quiet
    $boolean = $requete.TcpTestSucceeded
}else
{# port suivan
    $requete=Test-NetConnection -Port  $numerodeport -ComputerName $cible -InformationLevel Quiet
    $boolean = $requete.TcpTestSucceeded
    $numerodeport++
    }
}
