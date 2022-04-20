--
-- Configs for NERDCommenter plugin
--

-- Add spaces after comment delimiters by default
vim.g["NERDSpaceDelims"] = 1

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g["NERDCommentEmptyLines"] = 1

local map = vim.api.nvim_set_keymap
-- Invoke comments by pressing ctrl /
map("", "<C-_>", "<plug>NERDCommenterToggle", { noremap = false })
