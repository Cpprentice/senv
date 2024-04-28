param(
    [Parameter(Mandatory=$True)][string]$Name
)

$senv = & "$PSScriptRoot\get-senv.ps1" -Name $Name

for ($i = 0; $i -lt $senv.values.length; $i += 1) {
    $variable = $senv.variables[$i]
    $value = $senv.values[$i]

    if ($variable -eq "PATH") {
        $pieces = $env:PATH.Split(";") | Where {$_ -ne $value}
        $Env:PATH = $pieces -Join ";"
    } else {
        Remove-Item env:$variable
    }
}
