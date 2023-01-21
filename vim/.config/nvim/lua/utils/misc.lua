M = {}

M.foldText = function()
  local line_count = (vim.v.foldend - vim.v.foldstart) + 1
  local start_line = vim.fn.getline(vim.v.foldstart)
  local end_line = vim.fn.getline(vim.v.foldend)

  return string.format(
    "%s %s...(%d)",
    vim.v.folddashes,
    start_line,
    end_line,
    line_count
  )
end

return M
