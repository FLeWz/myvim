--[[
To rename multiple at the same time (regex):
    NORMAL
    /search<CR>
    cgn
    rename
    NORMAL
    n.
]]--

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- generic
vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC>:w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>bw", ":highlight trailwhite ctermbg=red guibg=red<CR>:match trailwhite /\\s\\+$/<CR>", { desc = "Highlight trailing whitespace" })

-- telescope
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Fuzzy grep" })
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Fuzzy buffers" })
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Fuzzy help tags" })
vim.keymap.set("n", "<leader>fd", function() require('telescope').extensions.media_files.media_files() end, { desc = "Fuzzy media files" })

-- bufferline
vim.keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<S-tab>", ":bprevious<CR>", { desc = "Previous tab"})
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close tab" })

-- neo-tree
vim.keymap.set('n', '<leader>n', ':Neotree selector<CR>', { desc = "Open file tree" })
vim.keymap.set('n', '<C-n>', ':Neotree close<CR>', { desc = "Close file tree" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP show info" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "View references" })
vim.keymap.set("n", "<leader>lx", ":Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })

-- DAP
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })

vim.keymap.set("n", "<F5>", function()
    if vim.fn.filereadable(".vscode/launch.json") then
        require("dap.ext.vscode").load_launchjs(nil, {
            gdb = { "c", "cpp" },
            gdb_tx_colibri_bsp5 = { "c", "cpp" },
        })
    end

    require("dap").continue()
end, { desc = "Debug continue" })

vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "Debug step over" })
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "Debug step into" })

-- CMP
-- <C-e>
-- <C-b>
-- <C-f>
-- <C-Space>
-- <CR>

-- GIT
vim.keymap.set("n", "<leader>gc", function() require("gitsigns").preview_hunk() end, { desc = "Git preview changes" })
vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "Git show diff" })
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })

-- inc-rename
vim.keymap.set("n", "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true, desc = "LSP rename" })

-- undotree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Show undo tree" })
