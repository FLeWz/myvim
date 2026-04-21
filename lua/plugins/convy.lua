return {
	"necrom4/convy.nvim",
	cmd = { "Convy", "ConvySeparator" },
	opts = {},
	keys = {
		{
			"<leader>cc",
			":Convy<CR>",
			desc = "Convert (interactive selection)",
			mode = { "n", "v" },
			silent = true,
		},
		{
			"<leader>cd",
			":Convy auto dec<CR>",
			desc = "Convert to decimal",
			mode = { "n", "v" },
			silent = true,
		},
		{
			"<leader>cs",
			":ConvySeparator<CR>",
			desc = "Set convertion separator (visual selection)",
			mode = { "v" },
			silent = true,
		},
	},
}
