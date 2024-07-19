return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "asm_lsp",
                    "bashls",
                    "clangd",
                    "cmake",
                    "autotools_ls",
                    "cssls",
                    "html",
                    "htmx",
                    "jsonls",
                    "quick_lint_js",
                    "tsserver",
                    "markdown_oxide",
                    "intelephense",
                    "pylsp",
                    "sqlls",
                    "lemminx",
                    "yamlls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.asm_lsp.setup({
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.cmake.setup({
                capabilities = capabilities,
            })
            lspconfig.autotools_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.htmx.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })
            lspconfig.quick_lint_js.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.markdown_oxide.setup({
                capabilities = capabilities,
            })
            lspconfig.intelephense.setup({
                capabilities = capabilities,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
            })
            lspconfig.sqlls.setup({
                capabilities = capabilities,
            })
            lspconfig.lemminx.setup({
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
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

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
