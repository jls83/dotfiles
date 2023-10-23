M = {}

local navic = require('nvim-navic')
local navbuddy = require('nvim-navbuddy')

local lsp_formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
    -- TODO: Does this require documentSymbolProvider also?
    navbuddy.attach(client, bufnr)
  else
    print("Can't use navic here")
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_clear_autocmds({ group = lsp_formatting_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = lsp_formatting_augroup,
      buffer = bufnr,
      callback = function()
        -- A number of our SQL files shouldn't be autoformatted.
        if (vim.bo.filetype == 'googlesql' or vim.bo.filetype == 'sql') then
          return
        end
        -- I am not a huge fan of the way lua_ls does formatting.
        if (vim.bo.filetype == 'lua') then
          return
        end
        vim.lsp.buf.format()
      end,
    })
  end
end

local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local ufo_capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

M.capabilities = vim.tbl_deep_extend(
  'force',
  base_capabilities,
  cmp_capabilities,
  ufo_capabilities
)

M.mason_setup = function(servers)
  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = servers,
  })
end

return M
