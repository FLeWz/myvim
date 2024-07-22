return {
    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            local signs = require('gitsigns')

            signs.setup()

            vim.keymap.set('n', '<leader>hp', signs.preview_hunk, { desc = "Git preview changes" })
            vim.keymap.set('n', '<leader>hd', signs.diffthis, { desc = "Git show diff" })
        end
    },
    {
        "tpope/vim-fugitive",
    }
}
