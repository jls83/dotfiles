local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>u', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local servers = {'pyright', 'tsserver', 'clojure_lsp', 'rust_analyzer', 'clangd'}
-- local servers = {'jedi_language_server', 'tsserver', 'clojure_lsp', 'rust_analyzer', 'clangd'}

-- TODO: Will need to merge this with the server-side `capabilities` I think
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
    local config = {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
    if lsp == 'pyright' then
        config['cmd'] = {'/usr/local/bin/pyright-langserver', '--stdio'}
    elseif lsp == 'tsserver' then
        config['cmd'] = {'/usr/local/bin/typescript-language-server', '--stdio'}
        config['analysis'] = {
            typeCheckingMode = 'off',
        }
    end

    nvim_lsp[lsp].setup(config)
end
