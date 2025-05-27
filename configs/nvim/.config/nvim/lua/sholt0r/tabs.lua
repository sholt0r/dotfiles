local function get_git_tabwidth()
  local git_dir = vim.fn.finddir('.git', '.;')
  if git_dir == '' then return 2 end

  local handle = io.popen('git config --get nvim.tabwidth')
  if not handle then return 2 end

  local result = handle:read('*a')
  handle:close()

  local width = tonumber(vim.trim(result))
  return width or 2
end

vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = '*',
  callback = function()
    local tabwidth = get_git_tabwidth()
    if tabwidth then
      vim.opt.tabstop = tabwidth
      vim.opt.softtabstop = tabwidth
      vim.opt.shiftwidth = tabwidth
      vim.opt.expandtab = true
      vim.opt.smartindent = true
    end
  end,
})


