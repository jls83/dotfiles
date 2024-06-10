return {
  -- "luukvbaal/statuscol.nvim",
  "jls83/statuscol.nvim",
  branch = "modified_foldfunc",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      segments = {
        {
          text = { "%s" },
        },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
        },
        {
          -- text = { builtin.foldfunc, " " },
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
        },
      },
    })
  end,
}
