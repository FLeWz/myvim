return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")

        config.setup({
            ensure_installed = {
                "lua", "bash",
                "csv", "xml", "gitignore", "bitbake",
                "ini", "json", "yaml",
                "doxygen", "jsdoc", "luadoc", "phpdoc",
                "c", "cpp", "asm", "cmake", "make", "python", "regex",
                "html", "css", "javascript", "tsx", "php", "sql",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
