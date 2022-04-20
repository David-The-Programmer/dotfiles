--
-- Bootstraps installation of paq and plugins headlessly
--

local pkgs = {
    -- Plugin manager
    "savq/paq-nvim";

    -- Replace default filetype plugin for faster startup
    "nathom/filetype.nvim";

    -- Colourscheme
    "Mofiqul/vscode.nvim";

    -- Editing with convenience
    "tpope/vim-surround";
    "vim-scripts/ReplaceWithRegister";
    "bkad/CamelCaseMotion";

    -- Making comments
    "preservim/nerdcommenter";

    -- Statusline & Tabline
    "nvim-lualine/lualine.nvim";

    -- Telescope
    "nvim-lua/plenary.nvim";
    "BurntSushi/ripgrep";
    "nvim-telescope/telescope.nvim";
    { "nvim-telescope/telescope-fzf-native.nvim", run="make" };

    -- LSP
    "neovim/nvim-lspconfig";
    "williamboman/nvim-lsp-installer";

    -- LSP autocompletion
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-path";
    "L3MON4D3/LuaSnip";
    "saadparwaiz1/cmp_luasnip";

    -- Syntax highlighting
    "nvim-treesitter/nvim-treesitter";

    -- Autoclose parenthesis, quotes, etc
    "Raimondi/delimitMate";

}


local function clone_paq()
    local path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
    if vim.fn.empty(vim.fn.glob(path)) > 0 then
        vim.fn.system {
            "git",
            "clone",
            "--depth=1",
            "https://github.com/savq/paq-nvim.git",
            path
        }
    end
end

local function bootstrap_paq()
    clone_paq()
    -- Load Paq
    vim.cmd("packadd paq-nvim")
    local paq = require("paq")
    -- Exit nvim after installing plugins
    vim.cmd("autocmd User PaqDoneInstall quit")
    -- Read and install packages
    paq(pkgs)
    paq.install()
end

return {
    bootstrap_paq = bootstrap_paq;
    pkgs = pkgs;
}
