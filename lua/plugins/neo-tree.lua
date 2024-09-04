return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            buffers = {
                follow_current_file = true,
            },
            filesystem = {
                follow_current_file = true,
                filtered_items = {
                    visible = true
                },
            },
        })
    end
}
