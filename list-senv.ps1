$senvs = & "$PSScriptRoot\get-senv.ps1"

foreach($senv in $senvs) {
    Write-Host $senv.name
    
    # Write-Host $variables
    # Write-Host $values

    # foreach ($piece in $pieces[1..-1]) {
    #     Write-Host $piece
    # }
}

