return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},
		config = function()
			local telescope = require("telescope")

			telescope.load_extension("ui-select")
			telescope.load_extension("media_files")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				callback = function(ctx)
					vim.api.nvim_buf_call(ctx.buf, function()
						vim.fn.matchadd("TelescopeParent", "\t\t.*$")
						vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
					end)
				end,
			})

			local function filenameFirst(_, path)
				local tail = vim.fs.basename(path)
				local parent = vim.fs.dirname(path)
				if parent == "." then return tail end
				return string.format("%s\t\t%s", tail, parent)
			end

			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					media_files = {
						find_cmd = "rg"
					},
				},
				pickers = {
					find_files = {
						path_display = filenameFirst,
					}
				}
			})
		end,
	},
}
