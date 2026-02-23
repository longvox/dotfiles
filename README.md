# Dotfiles

Personal dotfiles and system bootstrap for development (fullstack, DevOps, AI/LLM). Clone and run `./bootstrap.sh` to install.

## Installation

```bash
git clone --recurse-submodules https://github.com/longvox/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

**Nhập password sudo:**
- **Cách 1 (cửa sổ):** Chạy `./bootstrap-with-auth.sh` — sẽ hiện hộp thoại nhập mật khẩu (cần `zenity`: `sudo apt install zenity` nếu chưa có).
- **Cách 2 (terminal):** Chạy `./bootstrap.sh` trong terminal, nhập password khi sudo hỏi.

## Repository structure (senior sysadmin-style)

```
.dotfiles/
├── bootstrap.sh           # Single entrypoint: runs all phases in order
├── install/
│   ├── lib/               # Shared library (sourced by phases)
│   │   ├── env.sh         # DOTFILES_ROOT, INSTALL_DIR, DOT_DIR, TEMP_INSTALL_DIR + sources log + install
│   │   ├── log.sh         # info, error, warning, silly, etc.
│   │   └── install.sh     # tryInstall, install, installPip, installGem, command_exists, ...
│   ├── phases/            # Numbered install phases (run in sort order)
│   │   ├── 00-mirror-vn.sh      # Mirror VN (Viettel); SKIP_VN_MIRROR=1 để bỏ qua
│   │   ├── 00-repos.sh    # APT/PPA repositories
│   │   ├── 05-ubuntu-config.sh  # Ubuntu base: APT config (parallel, IPv4, an toàn), locale, GNOME
│   ├── apt-conf.d/         # APT options: 99-dotfiles-apt.conf (force-confdef/confold, no lang)
│   │   ├── 10-packages.sh # Base system packages + Docker, fzf, eza, termdown, ...
│   │   ├── 20-link.sh     # Stow symlinks (dot/ -> $HOME)
│   │   ├── 30-git.sh      # Git config (interactive)
│   │   ├── 40-gui.sh      # GUI apps (kitty, snap apps)
│   │   ├── 50-nvim.sh     # Neovim, ranger, lazygit, lazydocker, pynvim
│   │   ├── 52-lang.sh     # Languages: runs install/lang/index.sh (python, ruby, java, …)
│   │   ├── 60-ai.sh       # pipx, Ollama, Hugging Face CLI, Jupyter
│   │   ├── 65-devops.sh   # kubectl, Helm, Terraform, OpenTofu, AWS CLI, Azure CLI, gh
│   │   ├── 70-lang-ruby.sh
│   │   ├── 80-zsh.sh      # Zsh, Oh My Zsh, plugins, Starship
│   │   └── 90-post.sh     # Cleanup, set default shell
│   ├── lang/              # Optional language runtimes (edit index.sh to enable)
│   │   ├── index.sh       # Sources which lang scripts to run (java, go, node, php, rust, lua, julia)
│   │   └── python.sh, ruby.sh, java.sh, go.sh, javascript.sh, php.sh, rust.sh, lua.sh, julia.sh
│   └── utils/             # Helpers (e.g. install-gnome-shell.sh) used by lib/install.sh
├── dot/                   # Stow source (symlinked into $HOME)
│   ├── .zshrc, .zshenv, .zsh/
│   ├── .tmux.conf, .tmux/
│   ├── .config/           # kitty, lazygit, git hooks
│   └── ...
└── README.md
```

- **Single entrypoint:** `bootstrap.sh` sources `install/lib/env.sh` then runs every `install/phases/*.sh` in sort order. No hardcoded script list; add a new `XX-name.sh` to add a phase.
- **Shared env:** All phases source `../lib/env.sh`, which sets `DOTFILES_ROOT`, `INSTALL_DIR`, `DOT_DIR`, `TEMP_INSTALL_DIR` and loads log + install helpers.
- **Idempotent:** `tryInstall` and package helpers skip already-installed items where possible.

## Components

- **Shell:** Zsh, Oh My Zsh, plugins (syntax-highlighting, autosuggestions, nvm, …), Starship prompt.
- **Editor:** Neovim (tarball by arch), pynvim.
- **Terminal:** Tmux, Kitty.
- **DevOps:** Docker, kubectl, Helm, Terraform, OpenTofu, AWS CLI, Azure CLI, GitHub CLI (gh), lazygit, lazydocker.
- **AI/LLM:** Python (venv), pipx, Ollama, Hugging Face CLI, Jupyter.
- **Languages:** Python, Ruby (optional), Node via nvm (from dot config).

## Updating

```bash
cd ~/.dotfiles
git pull
./bootstrap.sh
```

## License

MIT.
