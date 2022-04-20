--
-- Configs for telescope plugin
--

require("telescope").load_extension("fzf")

local map = vim.api.nvim_set_keymap
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = false })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = false })
