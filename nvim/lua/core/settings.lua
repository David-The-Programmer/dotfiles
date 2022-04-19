--
-- This file contains all the neovim settings
--

local set = vim.opt

-- Show relative line numbers on the side
set.number = true
set.relativenumber = true

-- Limit size of tab to be 4 spaces
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4

-- Highlight text upon yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=200})")

-- Enable usage of true colours in the terminal
set.termguicolors = true

-- Disable syntax highlighting in favour of nvim-treesitter
vim.cmd("syntax off")
