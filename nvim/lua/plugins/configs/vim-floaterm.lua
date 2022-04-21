--
-- Configs for vim-floaterm plugin
--

-- Set terminal to be fullscreen width
vim.g.floaterm_width = vim.o.columns

-- Set terminal to be at the bottom
vim.g.floaterm_position = "bottom"

-- Set borderline to be grey
vim.cmd("hi FloatermBorder guifg=grey")

-- Keymap to toggle new instance of terminal
vim.g.floaterm_keymap_new = "<C-t>"

-- Keymap to toggle previous instance of terminal
vim.g.floaterm_keymap_prev = "<C-p>"

-- Keymap to toggle next instance of terminal
vim.g.floaterm_keymap_next = "<C-n>"

-- Keymap to toggle current instance of terminal
vim.g.floaterm_keymap_toggle = [[<C-\>]]

-- Keymap to kill current instance of terminal
vim.g.floaterm_keymap_kill= "<C-k>"

