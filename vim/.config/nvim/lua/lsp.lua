local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities(base_capabilities)

vim.lsp.config('*', {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspFormatting', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- if client.server_capabilities.documentFormattingProvider then
    if client.supports_method("textDocument/formatting", args.buf) then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          -- A number of our SQL files shouldn't be autoformatted.
          if (vim.bo.filetype == 'googlesql' or vim.bo.filetype == 'sql') then
            return
          end
          -- I am not a huge fan of the way lua_ls does formatting.
          if (vim.bo.filetype == 'lua') then
            return
          end
          vim.lsp.buf.format({ async = false, id = args.data.client_id })
        end,
      })
    end
  end,
})

-- vim.lsp.config('pyright', {})
-- vim.lsp.config('clojure_lsp', {})
-- vim.lsp.config('clangd', {})

vim.lsp.config('rust_analyzer', {
  settings = {
    ["rust-analyzer"] = {
      procMacro = { enable = true, attributes = { enable = true } },
      checkOnSave = {
        command = "clippy",
      },
    }
  }
})


vim.lsp.config('lua_ls', {
  settings = {
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
})

vim.lsp.config('fennel_language_server', {
  settings = {
    fennel = {
      diagnostics = {
        globals = {'vim', 'comment', 'case'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('clojure_lsp')
vim.lsp.enable('fennel_language_server')
