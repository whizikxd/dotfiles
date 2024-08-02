My dotfiles, organized in a way in which they can be easily used with GNU Stow

### Use my config
1. First clone the repository
```
git clone https://github.com/whizikxd/dotfiles.git
```
2. Use stow to generate symlinks (you might need to remove the existing files first)
```
stow --target ~/ .
```

