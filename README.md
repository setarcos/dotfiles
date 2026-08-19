# Dotfiles

My local dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What is stow?

Stow is a symlink-based dotfile manager. Instead of copying config files into your home directory, it creates symbolic links from the dotfiles repo to their target locations (e.g. `~/.config/nvim` -> `dotfiles/nvim`). This means:

- One source of truth: you edit files in the repo, changes apply immediately.
- Easy to version control with git.
- Reversible: `stow -D <package>` removes the symlinks without touching your files.

## Usage

```sh
git clone <this repo> ~/dotfiles
cd ~/dotfiles
./setup.sh
```

`setup.sh` runs two stow commands:

1. `stow . --target=$HOME/.config --ignore zsh` — links every top-level directory (alacritty, nvim, sway, ...) into `~/.config/`.
2. `stow zsh --target=$HOME` — links the `zsh/` package into `$HOME`. Thanks to `--dotfiles` in `.stowrc`, `zsh/dot-zshrc` becomes `~/.zshrc`.

Useful stow options (see `.stowrc` for what's enabled here):

- `--dotfiles`: renames files starting with `dot-` to dotfiles (`dot-zshrc` -> `.zshrc`).
- `--ignore <name>`: skips the given files/directories.
- `-D`: un-stow (remove symlinks).
