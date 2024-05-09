vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Remap next left tab (gT) and next right tab (gt) to Q and W respectively
vim.keymap.set("n", "Q", "gT")
vim.keymap.set("n", "W", "gt")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
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
    }
})
