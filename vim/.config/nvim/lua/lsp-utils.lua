M = {}

local navic = require('nvim-navic')

-- NOTE: This may not be the best place...
require('fidget').setup({
    text = {
        spinner = "dots",
    },
})

M.on_attach = function(client, bufnr)
    local opts = { silent = true, buffer = bufnr }

    vim.keymap.set('n', '<leader>gd', function()
        return require('telescope.builtin').lsp_definitions()
    end, opts)
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    else
        print("Can't use navic here")
    end
end


local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

M.capabilities = vim.tbl_deep_extend(
    'force',
    base_capabilities,
    cmp_capabilities
)

M.mason_setup = function(servers)
    require('mason-lspconfig').setup({
        ensure_installed = servers,
    })
end

return M
