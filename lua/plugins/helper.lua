return {
    {
        "folke/which-key.nvim",
        dependencies = {
            "echasnovski/mini.icons",
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({
                        global = false,
                    })
                end,
                desc = "Buffer Local Keymaps",
            },
        },
    },
}