local nvim_lsp = require('lspconfig')

-- TODO: move this to a different place?
require('fidget').setup({
    text = {
        spinner = "dots",
    },
})

local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', '<leader>gd', '<Cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
    buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

local servers = {'pyright', 'tsserver', 'clojure_lsp', 'rust_analyzer', 'clangd'}

local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local capabilities = vim.tbl_deep_extend(
    'force',
    base_capabilities,
    cmp_capabilities
)

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
    elseif lsp == 'clangd' then
        config['cmd'] = {'/usr/local/opt/llvm/bin/clangd', '--stdio'}
    end

    nvim_lsp[lsp].setup(config)
end
