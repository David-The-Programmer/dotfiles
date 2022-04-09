--
-- This file holds all keymaps for neovim settings & plugins
--

local map = vim.api.nvim_set_keymap

-- Remap for shifting between tabs
map("n", "Q", "gT", { noremap = true })
map("n", "W", "gt", { noremap = true })

-- Set the leader key to space
vim.g.mapleader = " "

-- Keymaps for NERD Commenter plugin
-- Invoke comments by pressing ctrl /
map("", "<C-_>", "<plug>NERDCommenterToggle", { noremap = false })
