--
-- Configs for the vim airline plugin
--

-- Need this for airline status bar to use correct font for rendering
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
