vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save
map("n", "<leader>w", "<cmd>w<CR>", opts)

-- Quit
map("n", "<leader>q", "<cmd>q<CR>", opts)

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
