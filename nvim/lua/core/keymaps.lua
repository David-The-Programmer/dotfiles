--
-- This file holds general keymaps to be used with or without plugins
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

-- Clear highlight until next search
map("n", "<esc>", "<cmd>noh<return><esc>", { noremap = true, silent = true })

