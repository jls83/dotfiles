M = {}

local navic = require('nvim-navic')

-- NOTE: This may not be the best place...
require('fidget').setup({
    text = {
        spinner = "dots",
    },
})


M.on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', '<leader>gd', '<Cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
    buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    else
        print("Not possible here")
    end
end


local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

M.capabilities = vim.tbl_deep_extend(
    'force',
    base_capabilities,
    cmp_capabilities
)

return M
