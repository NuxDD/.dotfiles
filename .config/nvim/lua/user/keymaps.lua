local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local NORMAL_MODE = "n"
local INSERT_MODE = "i"
local VISUAL_MODE = "v"
local VISUAL_BLOCK_MODE = "x"

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Windows navigation
keymap(NORMAL_MODE, "<C-h>", "<C-w>h", opts)
keymap(NORMAL_MODE, "<C-j>", "<C-w>j", opts)
keymap(NORMAL_MODE, "<C-k>", "<C-w>k", opts)
keymap(NORMAL_MODE, "<C-l>", "<C-w>l", opts)

-- Open directory listing
keymap(NORMAL_MODE, "<leader>e", ":Lex 30<CR>", opts)

-- Remove search highlighting when pressing ESC in normal mode
keymap(NORMAL_MODE, "<ESC>", ":noh <CR>", opts)

-- Press "jk" to get back to normal mode
keymap(INSERT_MODE, "jk", "<ESC>", opts)

-- Moving text/blocks maps
keymap(VISUAL_MODE, "<A-j>", ":m .+1<CR>==V", opts)
keymap(VISUAL_MODE, "<A-k>", ":m .-2<CR>==V", opts)
keymap(NORMAL_MODE, "<A-j>", ":m .+1<CR>==", opts)
keymap(NORMAL_MODE, "<A-k>", ":m .-2<CR>==", opts)
keymap(VISUAL_BLOCK_MODE, "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap(VISUAL_BLOCK_MODE, "<A-k>", ":move '<-2<CR>gv-gv", opts)
