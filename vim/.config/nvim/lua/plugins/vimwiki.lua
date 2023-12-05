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
        pattern = "*",
        callback = function(_)
          -- NOTE: It is endlessly irritating that I have to do this rather than a pure Lua solution.
          vim.cmd([[
            let g:vimwiki_syntaxlocal_vars['markdown']['Link1'] = g:vimwiki_syntaxlocal_vars['default']['Link1']
          ]])
        end,
      }
    )
  end,
}
