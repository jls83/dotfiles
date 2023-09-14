local telescope = require('telescope')
local builtin = require('telescope.builtin')
require('utils.entry-display-creator')

telescope.setup({
    defaults = {
        -- top, right, bottom, left, NW, NE, SE, SW
        borderchars = {'═', '│', '═', '│', '╒', '╕', '╛', '╘'},
        -- borderchars = {'━', '│', '─', '│', '┍', '┑', '┘', '└'},
        -- These are the true defaults:
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {['<c-d>'] = 'delete_buffer'},
            },
            layout_strategy='bottom_pane',
            layout_config={prompt_position='bottom'},
            sort_mru = true,
            ignore_current_buffer = true,
        },
        live_grep = {
            additional_args = function(opts)
                return {'--hidden'}
            end,
        },
        grep_string = {
            additional_args = function(opts)
                return {'--hidden'}
            end,
        },
    },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

local function my_lsp_references()
    require('telescope.builtin')
    .lsp_references({
        layout_strategy = 'horizontal',
        show_line=false,
        entry_maker = makeEntryThing({}),
    })
end

local map_opts = { silent = true }

vim.keymap.set('n', '<leader>b', builtin.buffers, map_opts)
vim.keymap.set('n', '<leader>u', my_lsp_references, map_opts)
vim.keymap.set('n', '<C-p>', builtin.find_files, map_opts)
vim.keymap.set('n', '<leader>f', builtin.live_grep, map_opts)
vim.keymap.set('n', '<leader>t', function() builtin.live_grep({grep_open_files=true}) end, map_opts)
vim.keymap.set('v', '<leader>f', builtin.grep_string, map_opts)
vim.keymap.set('v', '<leader>t', function() builtin.grep_string({grep_open_files=true}) end, map_opts)

local galileo = require('galileo')
telescope.load_extension('galileo')

local g_constants = require('galileo.constants')

local other_projects_dir = '/Users/jls83/other_projects'
local cg = '(' .. g_constants.posix_portable_filename .. ')'

galileo.setup({
  patterns = {
    -- C++ items
    {
      pattern = other_projects_dir .. '/' .. cg .. '/' .. cg .. [[\.h]],
      subs = {
        other_projects_dir .. '/${1}/${2}.cc',
        other_projects_dir .. '/${1}/${2}_test.cc',
      },
    },
    {
      pattern = [[/Users/jls83/other_projects/([a-z_]+)/([a-z]+)\.cc]],
      subs = {
        '/Users/jls83/other_projects/${1}/${2}.h',
        '/Users/jls83/other_projects/${1}/${2}_test.cc',
      },
    },
    {
      pattern = [[/Users/jls83/other_projects/(?P<project_name>[a-z_]+)/(?P<module_name>[a-z]+)_test\.cc]],
      subs = {
        '/Users/jls83/other_projects/${project_name}/${module_name}.h',
        '/Users/jls83/other_projects/${project_name}/${module_name}.cc',
      },
    },
    -- Dart items
    {
      pattern = [[/Users/jls83/other_projects/([a-z_]+)/lib/([a-z]+)\.dart]],
      subs = {
        '/Users/jls83/other_projects/${1}/lib/${2}.template.html',
        '/Users/jls83/other_projects/${1}/lib/${2}.scss',
        '/Users/jls83/other_projects/${1}/tests/${2}_test.dart',
      },
    },
    {
      pattern = [[/Users/jls83/other_projects/([a-z_]+)/lib/([a-z]+)\.template\.html]],
      subs = {
        '/Users/jls83/other_projects/${1}/lib/${2}.dart',
        '/Users/jls83/other_projects/${1}/lib/${2}.scss',
        '/Users/jls83/other_projects/${1}/tests/${2}_test.dart',
      },
    },
    {
      pattern = [[/Users/jls83/other_projects/([a-z_]+)/lib/([a-z]+)\.scss]],
      subs = {
        '/Users/jls83/other_projects/${1}/lib/${2}.template.html',
        '/Users/jls83/other_projects/${1}/lib/${2}.dart',
        '/Users/jls83/other_projects/${1}/tests/${2}_test.dart',
      },
    },
    {
      pattern = [[/Users/jls83/other_projects/([a-z_]+)/tests/([a-z]+)_test\.dart]],
      subs = {
        '/Users/jls83/other_projects/${1}/lib/${2}.template.html',
        '/Users/jls83/other_projects/${1}/lib/${2}.scss',
        '/Users/jls83/other_projects/${1}/lib/${2}.dart',
      },
    },
  },
})

