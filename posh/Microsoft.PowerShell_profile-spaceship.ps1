Import-Module oh-my-posh -Scope Local -Force
Import-Module Terminal-Icons -Scope Local -Force
Import-Module Az -Scope Local -Force
oh-my-posh --init --shell pwsh --config $HOME/.poshthemes/spaceship.omp.json | Invoke-Expression
