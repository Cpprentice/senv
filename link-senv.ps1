param(
    [Parameter(Mandatory=$True)][string]$Name
)

$senv = & "$PSScriptRoot\get-senv.ps1" -Name $Name

$fields = @()
for ($i = 0; $i -lt $senv.values.length; $i += 1) {
    $variable = $senv.variables[$i]
    $value = $senv.values[$i]
    $fields += "$variable|$value"
}
$content = "$($senv.name)|" + ($fields -join "|")

New-Item ".senv.conf" -ItemType File -Force -Value "$content"
New-Item "senv_launcher.ps1" -ItemType File -Force -Value "powershell -NoExit `"$PSScriptRoot\enable-senv.ps1 $Name -Local`""
