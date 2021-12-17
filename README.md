# Oh My Azure Cloud Shell #

This provides an **OPINIONATED** collection of scripts to set up [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) and [oh-my-posh](https://ohmyposh.dev/) to your [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview?WT.mc_id=dotnet-52663-juyoo) environment.


## Getting Started ##


### For oh-my-zsh ###

If you want to apply [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) to your [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview?WT.mc_id=dotnet-52663-juyoo) environment, follow the steps below:

1. Open your [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview?WT.mc_id=dotnet-52663-juyoo).
2. Make sure you are in the bash prompt. If you are in the PowerShell prompt, enter `bash` to switch the prompt.
3. Clone this repository to your [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview?WT.mc_id=dotnet-52663-juyoo).

    ```bash
    git clone https://github.com/justinyoo/oh-my-azure-cloud-shell.git ~/oh-my-azure-cloud-shell
    ```

4. Run the following commands and follow the instruction on the screen.

    ```bash
    ~/oh-my-azure-cloud-shell/install.sh
    ```

   The command above will install the [Spaceship](https://github.com/spaceship-prompt/spaceship-prompt) theme by default. If you prefer the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme, run the following command:

    ```bash
    # Turn on the clock feature
    ~/oh-my-azure-cloud-shell/install.sh -t p10k -c

    # Turn off the clock feature
    ~/oh-my-azure-cloud-shell/install.sh -t p10k
    ```

5. Restart your [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview?WT.mc_id=dotnet-52663-juyoo).
6. If you want to turn on or off the clock feature while using the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme, run the following command:

    ```bash
    # Turn on the clock feature
    ~/oh-my-azure-cloud-shell/switch-p10k-clock.sh -c
    source ~/.p10k.zsh

    # Turn off the clock feature
    ~/oh-my-azure-cloud-shell/switch-p10k-clock.sh
    source ~/.p10k.zsh
    ```


### For oh-my-posh ###

If you want to apply [oh-my-posh](https://ohmyposh.dev/) to your [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview?WT.mc_id=dotnet-52663-juyoo) environment, follow the steps below:

1. Open your [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview?WT.mc_id=dotnet-52663-juyoo).
2. Make sure you are in the PowerShell prompt. If you are in the bash prompt, enter `pwsh` to switch the prompt.
3. Clone this repository to your [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview?WT.mc_id=dotnet-52663-juyoo).

    ```powershell
    git clone https://github.com/justinyoo/oh-my-azure-cloud-shell.git ~/oh-my-azure-cloud-shell
    ```

4. Run the following commands and follow the instruction on the screen.

    ```powershell
    ~/oh-my-azure-cloud-shell/install.ps1
    ```

   The command above will install the [Spaceship](https://ohmyposh.dev/docs/themes#spaceship) theme by default. If you prefer the [Powerlevel10k - Rainbow](https://ohmyposh.dev/docs/themes#powerlevel10k_rainbow) theme, run the following command:

    ```powershell
    # Turn on the clock feature
    ~/oh-my-azure-cloud-shell/install.ps1 -Theme p10k -WithClock

    # Turn off the clock feature
    ~/oh-my-azure-cloud-shell/install.ps1 -Theme p10k
    ```

5. If you want to turn on or off the clock feature while using the [Powerlevel10k - Rainbow](https://ohmyposh.dev/docs/themes#powerlevel10k_rainbow) theme, run the following command:

    ```powershell
    # Turn on the clock feature
    ~/oh-my-azure-cloud-shell/switch-p10k-clock.ps1 -WithClock
    . $PROFILE

    # Turn off the clock feature
    ~/oh-my-azure-cloud-shell/switch-p10k-clock.ps1
    . $PROFILE
    ```


## Elements of oh-my-zsh ##

* Themes:
  * [Spaceship](https://github.com/spaceship-prompt/spaceship-prompt)
  * [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* Plugins:
  * [zsh-completions](https://github.com/zsh-users/zsh-completions)
  * [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)


## Elements of oh-my-posh ##

* Themes:
  * [Spaceship](https://ohmyposh.dev/docs/themes#spaceship)
  * [Powerlevel10k - Rainbow](https://ohmyposh.dev/docs/themes#powerlevel10k_rainbow)
* Plugins:
  * [Terminal Icons](https://github.com/devblackops/Terminal-Icons)
