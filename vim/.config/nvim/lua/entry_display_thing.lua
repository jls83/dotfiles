local utils = require('telescope.utils')
local strings = require('plenary.strings')
local entry_display = require('telescope.pickers.entry_display')

function makeEntryThing(opts)
  local default_opts = {
    disable_devicons = false,         -- disable devicons in pickers

    -- Highlight groups to configure the look and feel of the selection area
    directory_hl_group = 'TelescopeResultsComment',
    filename_hl_group = 'TelescopeResultsClass',
    lnum_hl_group = 'TelescopeResultsNumber',
    file_content_hl_group = 'TelescopeResultsComment',
  }
  if (opts == nil) then
    opts = default_opts
  else
    opts = vim.tbl_deep_extend('force', default_opts, opts)
  end

  function gen_from_lsp_reference(entry)
    if entry == '' or entry == nil then
      return nil
    end

    -- Load the filename_transform into the appropriate `opts` attribute.
    local filename_transform_opts = vim.tbl_deep_extend(
      'force',
      opts,
      { path_display = opts.filename_transform }
    )
    entry.filename = utils.transform_path(filename_transform_opts, entry.filename)

    local make_display = function(entry)
      local display = entry.filename

      -- using this helper makes sure that the extension respects
      -- the path_display configuration set by the user.
      -- See :help telescope.changelog-839 for more info
      local display_transform_opts = vim.tbl_deep_extend(
        'force',
        opts,
        { path_display = opts.display_transform }
      )
      display = utils.transform_path(display_transform_opts, display)

      local directory = nil
      local filename = nil
      directory, filename = display:match('^(.+/)(.+)$');
      if (directory == nil) then
        -- if we couldn't match a directory, this means that the filename was
        -- so big that the directory became completely truncated. When this happens
        -- display is a truncated version of the filename.
        directory = ''
        filename = display
      end

      local icon, hl_group = utils.get_devicons(filename, opts.disable_devicons)

      local icon_width = 0
      if not opts.disable_devicons then
        local templateIcon, _ = utils.get_devicons('fname', opts.disable_devicons)
        icon_width = strings.strdisplaywidth(templateIcon)
      end

      -- This object defines the slots that will be shown in the telescope
      -- selector and assigns a width to each one of these slots.
      local displayer = entry_display.create({
        -- we don't use a separator because the path, filename and lnum look
        -- better without it
        separator = '',
        items = {
          { width = icon_width },     -- Icon
          {},                         -- Path
          {},                         -- Filename
          { remaining = true },       -- Line number contents gets remaining space
        },
      })

      local function formatDirectory(directory)
        directory = directory or ''
        if (opts.disable_devicons) then
          return directory
        else
          return ' ' .. directory
        end
      end

      return displayer({
        { icon, hl_group },
        { formatDirectory(directory), opts.directory_hl_group },
        { (filename or ''),  opts.filename_hl_group },
        { ':' .. (entry.lnum or 0), opts.lnum_hl_group },
      })
    end

    local filename = entry.filename or vim.api.nvim_buf_get_name(entry.bufnr)

    return {
      valid = true,

      value = entry,
      ordinal = filename,
      display = make_display,

      bufnr = entry.bufnr,
      filename = filename,
      lnum = entry.lnum,
      col = entry.col,
      text = entry.text,
      start = entry.start,
      finish = entry.finish,
    }
  end
  return gen_from_lsp_reference
end
