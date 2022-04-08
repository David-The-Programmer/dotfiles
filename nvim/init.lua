local set = vim.opt
local map = vim.api.nvim_set_keymap

-- Turning on the line numbers on the side
set.number = true

-- Setting on the line numbers on the side to be relative
set.relativenumber = true

-- Limit size of tab to be 4 for proper indentation
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Remap for shifting between tabs
map("n", "Q", "gT", { noremap = true })
map("n", "W", "gt", { noremap = true })

-- Set the leader key to space
vim.g.mapleader = " "

-- Use paq to manage plugins
require "paq" {
    "savq/paq-nvim";

    "tomasiser/vim-code-dark";

    "tpope/vim-surround";
    "vim-scripts/ReplaceWithRegister";
    "bkad/CamelCaseMotion";

    "preservim/nerdcommenter";

    "vim-airline/vim-airline";
}

-- Theme configs
set.termguicolors = true
vim.cmd [[
    syntax enable
    colorscheme codedark
]]

-- Plugin Configs
-- Config for CamelCaseMotion
-- Set the camel case motion key
vim.g["camelcasemotion_key"] = "<leader>"

-- Config for NERD Commenter plugin
vim.cmd('filetype plugin on')
-- Invoke comments by pressing ctrl /
map("v", "<C-_>", "<plug>NERDCommenterToggle", { noremap = false })
map("n", "<C-_>", "<plug>NERDCommenterToggle", { noremap = false })

-- Add spaces after comment delimiters by default
vim.g["NERDSpaceDelims"] = 1

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g["NERDCommentEmptyLines"] = 1

-- Config for the vim airline plugin
-- Need this for airline status bar to display properly
vim.g["airline_powerline_fonts"] = 1

-- Code dark theme for vim airline plugin
vim.g["airline_theme"] = "codedark"

-- Show tab details in tab line
vim.g["airline#extensions#tabline#enabled"] = 1

-- Do not show buffers
vim.g["airline#extensions#tabline#show_buffers"] = 0

-- Show tabs instead of buffers
vim.g["airline#extensions#tabline#show_tabs"] = 1

-- Stop displaying tab number
vim.g["airline#extensions#tabline#show_tab_nr"] = 0

-- Prevents tab from displaying on the right
vim.g["airline#extensions#tabline#show_splits"] = 0

-- Stop displaying the close button
vim.g["airline#extensions#tabline#show_close_button"] = 0

-- Config for how file paths are displayed on tabs
vim.g["airline#extensions#tabline#formatter"] = "unique_tail"

vim.cmd("set noshowmode")
