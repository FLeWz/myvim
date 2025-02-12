return {
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require('eyeliner').setup({
                highlight_on_key = true,
                dim = true,
                max_length = 500,
                -- add eyeliner to f/F/t/T keymaps;
                default_keymaps = true,
            })
        end,
    }
}
