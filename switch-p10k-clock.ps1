Param(
    [switch]
    [Parameter(Mandatory=$false)]
    $WithClock
)

function Show-Usage {
    Write-Output "

    Usage: $(Split-Path $MyInvocation.ScriptName -Leaf) [-WithClock]

    Options:
        -WithClock: This switch enables clock.

        -Help:      Show this message.

"

    Exit 1
}

$poshthemes = "$HOME/.poshthemes"
if (!(Test-Path -Path $poshthemes)) {
    New-Item -ItemType Directory -Path $poshthemes -Force
}

# Install p10k with clock
if ($WithClock -eq $true) {
    Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Installing theme: Powerlevel10k with clock ..."
    Copy-Item $HOME/oh-my-azure-cloud-shell/posh/powerlevel10k_rainbow-with-clock.omp.json $HOME/.poshthemes/powerlevel10k_rainbow.omp.json -Force
}
# Install p10 without clock
else {
    Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Installing theme: Powerlevel10k without clock ..."
    Copy-Item $HOME/oh-my-azure-cloud-shell/posh/powerlevel10k_rainbow-without-clock.omp.json $HOME/.poshthemes/powerlevel10k_rainbow.omp.json -Force
}

# Copy $PROFILE
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Copying `$PROFILE ..."
if ($WithClock -eq $true) {
    Copy-Item $HOME/oh-my-azure-cloud-shell/posh/Microsoft.PowerShell_profile-p10k-with-clock.ps1 $HOME/.config/PowerShell/Microsoft.PowerShell_profile.ps1 -Force
} else {
    Copy-Item $HOME/oh-my-azure-cloud-shell/posh/Microsoft.PowerShell_profile-p10k-without-clock.ps1 $HOME/.config/PowerShell/Microsoft.PowerShell_profile.ps1 -Force
}

Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Switch completed. Run '. `$PROFILE' to apply changes ..."
