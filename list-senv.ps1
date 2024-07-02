param(
    [switch]$Local
)

$senvs = & "$PSScriptRoot\get-senv.ps1" -Local:$Local

foreach($senv in $senvs) {
    Write-Host $senv.name
    
    # Write-Host $variables
    # Write-Host $values

    # foreach ($piece in $pieces[1..-1]) {
    #     Write-Host $piece
    # }
}

