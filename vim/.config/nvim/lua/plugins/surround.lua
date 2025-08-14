-- return {
--   "kylechui/nvim-surround",
--   -- TODO: Move config
--   enabled = true,
--   -- event = "VeryLazy",
--   -- config = true,
--   -- require("nvim-surround").setup({})
--   -- end
-- }

return {
  "kylechui/nvim-surround",
  enabled = true,
  version = "^3.0.0",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end
}
