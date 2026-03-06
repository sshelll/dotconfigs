# Dotconfigs
> `XDG_CONFIG_HOME` on MacOS  
> Including: 
> - Editor: nvim
> - Terminal emulators: alacritty, wezterm, kitty
> - Terminal tools: lazygit, tmux, starship
> - Input method: rime

## Install
```sh
git clone https://github.com/sshelll/dotconfigs.git ~/dotconfigs

rsync -avh --ignore-existing ~/dotconfigs/* ~/.config

rm -r ~/dotconfigs
```

check [Rime](/Rime/README.md) for rime input method configuration.
