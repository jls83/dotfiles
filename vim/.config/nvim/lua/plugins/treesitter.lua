return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      modules = {},
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      ensure_installed = {
        'clojure',
        'cpp',
        'dart',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        -- 'proto',
        'python',
        'rust',
        'scss',
        -- 'sql',
        'typescript',
        'vim',
      },
      indent = { enable = false },
      highlight = { enable = true },
      matchup = {
        enable = true,
        disable_virtual_text = true,
      },
    })
  end,
}
