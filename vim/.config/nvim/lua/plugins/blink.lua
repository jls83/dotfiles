return {
  "saghen/blink.cmp",
  enabled = true,
  event = "InsertEnter",
  version = "1.*",
  opts = {
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", gap = 1, "kind" },
            { "source_name" },
          },
        },
      },
    },
    keymap = {
      ['<Tab>'] = {'select_next', 'fallback'},
      ['<S-Tab>'] = {'select_prev', 'fallback'},
    },
    snippets = { preset = 'luasnip' },
  },
}
