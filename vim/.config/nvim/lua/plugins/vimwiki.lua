return {
  "jls83/vimwiki",
  branch = "mixed_backlinks",
  init = function()
    local Keymap = require("utils.keymap")

    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki",
        syntax = "markdown",
        ext = ".md",
      },
    }
    vim.g.vimwiki_global_ext = 0

    -- Add a leading '../' to links to allow for linking to main wiki articles from
    -- the diary.
    Keymap.nnoremap("<leader>wl", "0f[wi../<ESC>")

    vim.api.nvim_create_autocmd(
    {"VimEnter"},
    {
      pattern = "*/vimwiki/*/*.md",
      command = "let g:vimwiki_syntaxlocal_vars['markdown']['Link1'] = g:vimwiki_syntaxlocal_vars['default']['Link1']",
    }
    )
  end,
}
