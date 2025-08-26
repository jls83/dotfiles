return {
  "saghen/blink.cmp",
  enabled = true,
  event = "InsertEnter",
  version = "1.*",
  opts = {
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      list = {
        -- max_items = 40,
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
          components = {
            label = {
              width = { fill = true, max = 40 },
            },
            kind_icon = {
              text = function(item)
                local kind = require("lspkind").symbol_map[item.kind] or ""
                return kind
              end,
            },
            source_name = {
              text = function(item)
                return "[" .. item.source_name .. "]"
              end,
            },
          },
        },
      },
    },
    keymap = {
      ['<Tab>'] = {'select_next', 'fallback'},
      ['<S-Tab>'] = {'select_prev', 'fallback'},
    },
  },
}
