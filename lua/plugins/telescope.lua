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

            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    media_files = {
                        find_cmd = "rg"
                    },
                },
            })
        end,
    },
}
