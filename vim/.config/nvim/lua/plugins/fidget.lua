return {
  "j-hui/fidget.nvim",
  tag = "legacy",
  config = function()
    require('fidget').setup({
      text = {
        spinner = "dots",
      },
    })
  end,
}
