# Dotfiles Setup Guide

## Prerequisites

- Git installed
- GitHub SSH key configured (`ssh -T git@github.com` to verify)
- tmux installed

## Steps

### 1. Clone the bare repository
```bash
git clone --bare git@github.com:consmit31/tmux-dotfiles.git $HOME/.dotfiles
```

### 2. Add the dotfiles alias
```bash
echo "alias dotfiles='git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >> ~/.bashrc
source ~/.bashrc
```

### 3. Check out the files
```bash
dotfiles checkout
```

If you see an error about existing files conflicting, back them up first:
```bash
mkdir -p ~/.dotfiles-backup
dotfiles checkout 2>&1 | grep -E "^\s+\." | awk '{print $1}' | xargs -I{} sh -c 'mkdir -p ~/.dotfiles-backup/$(dirname {}) && mv $HOME/{} ~/.dotfiles-backup/{}'
dotfiles checkout
```

### 4. Hide untracked files
```bash
dotfiles config --local status.showUntrackedFiles no
```

### 5. Install TPM and plugins

Clone TPM:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start a tmux session, then install plugins:
```
prefix + I
```

That's it — TPM will pull down all plugins listed in your `.tmux.conf`.

## Ongoing Usage
```bash
dotfiles status               # see tracked file changes
dotfiles add ~/.tmux.conf     # stage a change
dotfiles commit -m "message"  # commit
dotfiles push                 # push to GitHub
```
