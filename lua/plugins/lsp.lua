return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
			"FLeWz/clangd-direct-includes.nvim",
			"jay-babu/mason-null-ls.nvim",
			"nvimtools/none-ls.nvim",
        },
        config = function()
            -- :lua print(vim.inspect(vim.lsp.get_active_clients()))
            -- :LspInfo
            -- :CmpInfo

            require("mason").setup({})
			require("clangd-direct-includes")
			require("mason-null-ls").setup({
				ensure_installed = { "black" }
			})

            -- local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local null_ls = require("null-ls")

			--[[
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "jsonls",
                },
            })
			]]--

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.black,
				},
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("html")
			vim.lsp.enable("intelephense")
			vim.lsp.enable("clangd")
			vim.lsp.enable("clangd-direct-includes")
			vim.lsp.enable("basedpyright")

			vim.lsp.config("basedpyright", {
                capabilities = capabilities,
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "basic",
						}
					},
				},
			})

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
					"--completion-style=detailed",
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
    },
	{
		"sontungexpt/better-diagnostic-virtual-text",
		config = function()
			require('better-diagnostic-virtual-text').setup({ inline = false })
		end
	}
}
