local opts = { noremap = true, silent = true }


local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fw", "<cmd>lua vim.lsp.buf.formatting()<CR><cmd>w<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fwq", "<cmd>lua vim.lsp.buf.formatting()<CR><cmd>wq<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fwqa", "<cmd>lua vim.lsp.buf.formatting()<CR><cmd>wqa<CR>", opts)

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = capabilities
}

return {
    opts = opts
}
