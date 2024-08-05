# Install

Installation is in `/opt/nvim`.
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```
Append to `.bashrc`
```
#neovim
export PATH="$PATH:/opt/nvim-linux64/bin"
```

# Config

## Remove old config/plugins
Config: `rm -r ~/.config/nvim`  
Plugin cache: `sudo rm -r ~/.local/share/nvim`

## Create new config

```
cd ~/.config
git clone
mv clone nvim
```

## Required packages

`sudo apt install nodejs npm`

`curl https://sh.rustup.rs -sSf | sh`

`sudo apt install ripgrep`

https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation

`sudo apt install chafa`

