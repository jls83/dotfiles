local header_text = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    -- local dashboard = require('alpha.themes.dashboard')
    local startify = require('alpha.themes.startify')

    -- dashboard.section.buttons.val = {
    --   dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    --   dashboard.button("r", "  Recent"   , ":Telescope oldfiles<CR>"),
    --   dashboard.button("s", "  Settings" , ":e $MYVIMRC<CR>")
    -- }

    -- dashboard.section.header.val = header_text

    alpha.setup(startify.config)

    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end
};
