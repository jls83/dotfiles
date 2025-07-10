return {
  "stevearc/oil.nvim",
  enabled = false,
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
    })
  end
}
