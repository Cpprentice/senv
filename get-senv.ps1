param(
    [string]$Name
)

if (Test-Path "$Env:USERPROFILE\.senv.conf" -PathType Leaf) {
    $file = "$Env:USERPROFILE\.senv.conf"
} elseif (Test-Path "$PSScriptRoot\.senv.conf" -PathType Leaf) {
    $file = "$PSScriptRoot\.senv.conf"
} else {
    Write-Host "No .senv.conf file"
    return
}

$senvs = @()

foreach($line in Get-Content $file) {
    $pieces = $line.Split("|")

    $senvName = $pieces[0]
    $variables = @()
    $values = @()

    for ($i = 0; $i -lt ($pieces.length - 1); $i += 1) {
        if ($i % 2 -eq 0) {
            $variables += $pieces[$i + 1]
        } else {
            $values += $pieces[$i + 1]
        }
    }

    $newSenv = @{
        name = $senvName;
        variables = $variables;
        values = $values;
    }

    $senvs += $newSenv

    if ($PSBoundParameters.ContainsKey('Name') -and $senvName -eq $Name) {
        return $newSenv
    } 
}

return $senvs
