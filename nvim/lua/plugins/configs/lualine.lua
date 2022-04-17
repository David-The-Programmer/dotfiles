--
-- Configs for lualine plugin
--

require("lualine").setup {
    options = {
        theme = "vscode"
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {},
        lualine_z = {"location"}
  },
    tabline = {
        lualine_a = {
            {
                "tabs",
                -- Shows tab_name
                mode = 1, 
            }
        },
    },
}

-- Override default showing of mode as long as lualine is used
vim.cmd("set noshowmode")
