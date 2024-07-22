return {
    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            local signs = require('gitsigns')

            signs.setup()

            vim.keymap.set('n', '<leader>hp', signs.preview_hunk, {})
            vim.keymap.set('n', '<leader>hd', signs.diffthis, {})
        end
    },
    {
        "tpope/vim-fugitive",
    }
}
