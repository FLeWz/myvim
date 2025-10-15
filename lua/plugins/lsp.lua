return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- :lua print(vim.inspect(vim.lsp.get_active_clients()))
            -- :LspInfo
            -- :CmpInfo

            require("mason").setup({})

            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

			--[[
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "jsonls",
                },
            })
			]]--

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                filetypes = { "lua" },
            })

            lspconfig.intelephense.setup({
                capabilities = capabilities,
                settings = {
                    intelephense = {
                        diagnostics = {
                            typeErrors = false,
                            unusedSymbols = false,
                        },
                    },
                },
            })

            lspconfig.html.setup({
                capabilities = capabilities,
                filetypes = { "html", "php", "tsx" },
            })

            lspconfig.clangd.setup({
                cmd = {
                    vim.fn.stdpath("data") .. "/mason/bin/clangd",
                    "--header-insertion=never",
                },
            })
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
        config = function()
            require("fidget").setup({})
        end,
    }
}
