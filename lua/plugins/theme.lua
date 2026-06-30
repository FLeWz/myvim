return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
    --[[
    {
        "navarasu/onedark.nvim",
        config = function()
            local onedark = require("onedark")

            onedark.setup({
                style = "dark"
            })
            onedark.load()
        end,
    },
    --]]
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
                sections = {
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                        }
                    },
                },
            })
        end,
    },
}
