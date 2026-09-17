return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local signs = require("gitsigns")

			signs.setup()
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		'FLeWz/gen-commit-changelog.nvim',
		version = false,
		config = function()
			require('gen-commit-changelog')
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = false,
			message_template = "<date> | <author> | <summary> <<sha>>",
			date_format = "%r",
			virtual_text_column = 1,
		},
	},
}
