--
-- This file holds all keymaps for neovim settings & plugins
--

local map = vim.api.nvim_set_keymap

-- Set the leader key to space
vim.g.mapleader = " "

-- Remap for shifting between tabs
map("n", "Q", "gT", { noremap = true })
map("n", "W", "gt", { noremap = true })

-- Remap to allow navigation on wrapped line 
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })

-- Keymaps for NERD Commenter plugin
-- Invoke comments by pressing ctrl /
map("", "<C-_>", "<plug>NERDCommenterToggle", { noremap = false })
