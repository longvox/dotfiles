# Dotfiles

This repository contains my personal dotfiles for configuring my development environment. It includes various configuration files and scripts to set up a new system quickly.

## Installation

To install everything, simply clone this repository and run the install script:

```bash
git clone --recurse-submodules https://github.com/longvox/dotfiles.git
cd dotfiles
./bootstrap.sh
```

## Components

The install script will set up the following:

-   **Zsh**: Configuration for the Z shell, including Oh My Zsh and custom themes/plugins.
-   **Neovim**: Custom configurations and plugins for Vim/Neovim.
-   **Tmux**: Tmux configuration for managing terminal sessions.
-   **Git**: Custom git configuration and aliases.
-   **Others**: Additional configurations for various tools and utilities.

## Updating

To update your dotfiles, pull the latest changes from this repository and re-run the install script:

```bash
cd .dotfiles
git pull
./bootstrap.sh
```

## Contributing

If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License.
