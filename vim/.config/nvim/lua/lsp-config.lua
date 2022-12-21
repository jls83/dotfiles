local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')
local lsp_utils = require('lsp-utils')

local servers = {'pyright', 'tsserver', 'clojure_lsp', 'rust_analyzer', 'clangd', 'sumneko_lua'}

lsp_utils.mason_setup(servers)

for _, lsp in ipairs(servers) do
    local config = {
        on_attach = lsp_utils.on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = lsp_utils.capabilities,
    }
    -- if lsp == 'pyright' then
    --     config['cmd'] = {'/usr/local/bin/pyright-langserver', '--stdio'}
    -- elseif lsp == 'tsserver' then
    if lsp == 'tsserver' then
        -- config['cmd'] = {'/usr/local/bin/typescript-language-server', '--stdio'}
        config['analysis'] = {
            typeCheckingMode = 'off',
        }
    end

    nvim_lsp[lsp].setup(config)
end
