return {
    "luukvbaal/statuscol.nvim",
    config = function()
        local builtin = require("statuscol.builtin")
        vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:►]]

        require('statuscol').setup({
            segments = {
                { text = { "%s" }, click = "v:lua.ScSa", },
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
                {
                    sign = { name = { "Diagnostic" }, auto = true, maxwidth = 2, },
                    click = "v:lua.ScSa",
                },
                {
                    text = { " ", builtin.foldfunc, },
                    condition = { builtin.not_empty, true, builtin.not_empty, },
                    click = "v:lua.ScFa",
                },
                {
                    sign = { name = { ".*" }, auto = true, maxwidth = 2, },
                    click = "v:lua.ScSa",
                },
            }
        })
    end
}
