local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd

local NORMAL_MODE = "n"

autocmd("FileType", { pattern = "rust", 
    callback = function()
			keymap(NORMAL_MODE, "<leader>r", ":split<CR> :te cargo run<CR>", opts)
			keymap(NORMAL_MODE, "<leader>b", ":split<CR> :te cargo build<CR>", opts)
			keymap(NORMAL_MODE, "<leader>t", ":split<CR> :te cargo test<CR>", opts)
    end}
)
