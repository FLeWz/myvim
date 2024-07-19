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
mkdir ~/.config/nvim
cd ~/.config/nvim
touch init.lua
nvim init.lua
```

## Setup plugins

```
├── init.lua
├── lazy-lock.json
├── lua
│   ├── plugins
│   │   ├── plugin.lua
│   ├── plugins.lua
│   └── vim-options.lua
└── README.md
```

### Plugin manager
**Lazy**: https://lazy.folke.io/

### LSP
**Mason**: https://github.com/williamboman/mason.nvim

`sudo apt install nodejs npm`

`curl https://sh.rustup.rs -sSf | sh`

**None LS (null)**: https://github.com/nvimtools/none-ls.nvim

### Theme
**Catppuccin**: https://github.com/catppuccin/nvim

**Lualine**: https://github.com/nvim-lualine/lualine.nvim

**Alpha nvim**: https://github.com/goolord/alpha-nvim

### File finder
**Telescope**: https://github.com/nvim-telescope/telescope.nvim

**Telescope UI select**: https://github.com/nvim-telescope/telescope-ui-select.nvim

`sudo apt install ripgrep`

**Neo Tree**: https://github.com/nvim-neo-tree/neo-tree.nvim

### Source file tree parser
**Treesitter**: https://github.com/nvim-treesitter/nvim-treesitter

### Completion
**nvim-cmp**: https://github.com/hrsh7th/nvim-cmp

**luasnip**: https://github.com/L3MON4D3/LuaSnip

**cmp_luasnip**: https://github.com/saadparwaiz1/cmp_luasnip

**friendly-snippets**: https://github.com/rafamadriz/friendly-snippets

**cmp-nvim-lsp**: https://github.com/hrsh7th/cmp-nvim-lsp

### Debugging
**nvim dap**: https://github.com/mfussenegger/nvim-dap

**nvim dap ui**: https://github.com/rcarriga/nvim-dap-ui

**nvim nio**: https://github.com/nvim-neotest/nvim-nio
