return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            -- :lua print(vim.inspect(vim.lsp.get_active_clients()))

            require("mason").setup({})

            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "html",
                    "htmx",
                    "jsonls",
                    "quick_lint_js",
                },
            })

            mason_lspconfig.setup_handlers({
                function(server)
                    if server == "intelephense" then
                        return
                    end

                    lspconfig[server].setup({
                        capabilities = capabilities,
                    })
                end,
            })

            lspconfig.intelephense.setup({
                capabilities = capabilities,
                settings = {
                    intelephense = {
                        diagnostics = {
                            typeErrors = false,
                        },
                    },
                },
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier,
                },
            })
        end,
    },
}
