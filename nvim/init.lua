vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Remap next left tab (gT) and next right tab (gt) to Q and W respectively
vim.keymap.set("n", "Q", "gT")
vim.keymap.set("n", "W", "gt")

-- Remap focus of windows to use ctrl-h (left), ctrl-l (right), ctrl-j (down), ctrl-k (up)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Make session upon writing to file or quitting nvim
vim.api.nvim_create_autocmd({ "BufWritePost", "VimLeave"}, {
    desc = "Make session upon writing to file",
    callback = function()
        vim.cmd("mksession!")
    end,
}) 


-- Checks if lazy.nvim has been installed in neovim user data dir, if not, install the plugin by cloning the plugin into the user data dir
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins
require("lazy").setup({
    -- NOTE: Plugins can be added with a link (or for a github repo: "owner/repo" link).
    -- "gc" to comment visual regions/lines
    { "numToStr/Comment.nvim", opts = {} },
    { 
        "Mofiqul/vscode.nvim", 
        priority = 1000, -- Load this theme plugin before others
        init = function()
            vim.cmd.colorscheme("vscode")
        end,
    },
    { 
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "bash", "c", "diff", "go", "gomod", "gosum", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
            auto_installed = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
            -- Prefer git instead of curl in order to improve connectivity in some environments
            require("nvim-treesitter.install").prefer_git = true
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {}
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {}
    },
    { "vim-scripts/ReplaceWithRegister"},
    {
        "bkad/CamelCaseMotion",
        init = function()
            vim.g.camelcasemotion_key = "<leader>"
        end
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    }
})
