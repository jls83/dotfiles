if vim.env.MACHINE_TYPE == 'glinux' then
  return require('google.plugins')
else
  return {}
end
