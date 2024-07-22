return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local buffer = require("bufferline")

        vim.keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next tab" })
        vim.keymap.set("n", "<S-tab>", ":bprevious<CR>", { desc = "Previous tab"})
        vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close tab" })

        buffer.setup({
            options = {
                diagnostics = "nvim_lsp",
                numbers = "none",
                color_icons = true,
                show_tab_indicators = true,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    },
                },
                style_preset = buffer.style_preset.no_italic,
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
            },
        })
    end,
}
