return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            local dash = require("alpha.themes.dashboard")

            alpha.setup(dash.opts)
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "dracula",
                },
            })
        end,
    },
}
