param(
    [Parameter(Mandatory=$True)][string]$Name,
    [switch]$Local
)

$senv = & "$PSScriptRoot\get-senv.ps1" -Name $Name -Local:$Local

for ($i = 0; $i -lt $senv.values.length; $i += 1) {
    $variable = $senv.variables[$i]
    $value = $senv.values[$i]

    if ($variable -eq "PATH") {
        $Env:PATH = "$value;$Env:PATH"
    } else {
        Set-Item env:$variable -Value $value
    }
}
