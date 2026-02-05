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

            -- local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

			--[[
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "jsonls",
                },
            })
			]]--

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("html")
			vim.lsp.enable("intelephense")
			vim.lsp.enable("clangd")
			vim.lsp.enable("basedpyright")

            vim.lsp.config("html", {
                capabilities = capabilities,
                filetypes = { "html", "php", "tsx" },
            })

            vim.lsp.config("intelephense", {
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

            vim.lsp.config("clangd", {
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
