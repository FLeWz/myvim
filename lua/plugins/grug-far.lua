return {
    {
        "MagicDuck/grug-far.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require('grug-far').setup({})
        end,
    },
}
