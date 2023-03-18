--
-- This file is to configure mason, which manages the installation of lsp servers, dap adapters and more
--

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})



-- function lsp_servers returns all servers to be used
local function lsp_servers()
    local servers = {"gopls", "lua_ls", "tsserver", "html", "emmet_ls", "cssls", "jsonls"}
    return servers
end

return {
    lsp_servers = lsp_servers
}

-- TODO: Replace paq with lazy.nvim or packer to have TS auto update
