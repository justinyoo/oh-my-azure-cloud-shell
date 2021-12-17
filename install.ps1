Param(
    [string]
    [Parameter(Mandatory=$false)]
    $Theme = "spaceship",

    [switch]
    [Parameter(Mandatory=$false)]
    $WithClock
)

function Show-Usage {
    Write-Output "

    Usage: $(Split-Path $MyInvocation.ScriptName -Leaf) [-Theme theme] [-WithClock]

    Options:
        -Theme:     The name of Theme.
                    It only accepts either 'spaceship' or 'p10k'.
                    Default: 'spaceship'

        -WithClock: This switch enables clock, if the name of theme is 'p10k'.

        -Help:      Show this message.

"

    Exit 1
}

if ($Theme -eq "") {
    Write-Output "Theme not found"    
    Show-Usage

    Exit 1
} elseif (($Theme -ne "spaceship") -and ($Theme -ne "p10k")) {
    Write-Output "Theme not valid"
    Show-Usage

    Exit 1
}

# Install oh-my-posh
Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Installing oh-my-posh ..."
Install-Module oh-my-posh -Scope CurrentUser -Repository PSGallery -Force
Import-Module oh-my-posh -Scope Local -Force

# Install terminal icons
Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Installing Terminal Icons ..."
Install-Module Terminal-Icons -Scope CurrentUser -Repository PSGallery -Force
Import-Module Terminal-Icons -Scope Local -Force

$poshthemes = "$HOME/.poshthemes"
if (!(Test-Path -Path $poshthemes)) {
    New-Item -ItemType Directory -Path $poshthemes -Force
}

# Install theme: Spaceship
if ($Theme -eq "spaceship") {
    Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Installing theme: Spaceship ..."
    Copy-Item $HOME/oh-my-azure-cloud-shell/posh/spaceship.omp.json $HOME/.poshthemes/spaceship.omp.json -Force
}
# Install theme: Powerlevel10k
elseif ($Theme -eq "p10k") {
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
}

# Copy $PROFILE
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Copying `$PROFILE ..."
if ($Theme -eq "spaceship") {
    Copy-Item $HOME/oh-my-azure-cloud-shell/posh/Microsoft.PowerShell_profile-spaceship.ps1 $HOME/.config/PowerShell/Microsoft.PowerShell_profile.ps1 -Force
} elseif ($Theme -eq "p10k") {
    if ($WithClock -eq $true) {
        Copy-Item $HOME/oh-my-azure-cloud-shell/posh/Microsoft.PowerShell_profile-p10k-with-clock.ps1 $HOME/.config/PowerShell/Microsoft.PowerShell_profile.ps1 -Force
    } else {
        Copy-Item $HOME/oh-my-azure-cloud-shell/posh/Microsoft.PowerShell_profile-p10k-without-clock.ps1 $HOME/.config/PowerShell/Microsoft.PowerShell_profile.ps1 -Force
    }
}

# Activate oh-my-posh
Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Installation completed. Activating theme ..."
if ($Theme -eq "spaceship") {
    oh-my-posh --init --shell pwsh --config $HOME/.poshthemes/spaceship.omp.json | Invoke-Expression
} elseif ($Theme -eq "p10k") {
    oh-my-posh --init --shell pwsh --config $HOME/.poshthemes/powerlevel10k_rainbow.omp.json | Invoke-Expression
}
