return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "onsails/lspkind-nvim",
  },
  config = function()
    -- TODO: Move this to `master`; rethink
    if vim.env.MACHINE_TYPE == 'glinux' then
      return
    end

    local nvim_lsp = require('lspconfig')
    local lsp_utils = require('utils.lsp')

    -- local servers = {'pyright', 'clojure_lsp', 'rust_analyzer', 'clangd', 'lua_ls', 'java_language_server'}
    local servers = {'pyright', 'clojure_lsp', 'rust_analyzer', 'clangd', 'lua_ls'}

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
      if lsp == 'lua_ls' then
        config['settings'] = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        }
      elseif lsp == 'rust_analyzer' then
        config['settings'] = {
          ["rust-analyzer"] = {
            procMacro = { enable = true, attributes = { enable = true } },
            checkOnSave = {
              command = "clippy",
            },
          }
        }
      end

      nvim_lsp[lsp].setup(config)
    end
  end,
}
